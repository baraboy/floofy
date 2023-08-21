//
//  ScanView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 10/06/23.
//

import SwiftUI
import CoreML
import Vision

class ScanViewModel: ObservableObject {
    @Published var changeProfileImage = false
    @Published var openSheet = true
    @Published var showImagePicker = false
    @Published var sourceType: UIImagePickerController.SourceType = .camera
    @Published var imageSelected = UIImage()
    @Published var classificationLabel: String = ""
    @Published var confidencePercentage: String = ""
    @FetchRequest(sortDescriptors: []) private var pets: FetchedResults<PetsItem>
    @Environment(\.managedObjectContext) var moc
    struct LoadingError: Error, Identifiable {
        let id = UUID()
        let error: Error
    }
    @Published var modelLoadingError: LoadingError?
    @Published var modelLoaded = false
    private var model: FloofyModel?
    func loadModel() {
        do {
            let configuration = MLModelConfiguration()
            model = try FloofyModel(configuration: configuration)
            modelLoaded = true
        } catch {
            modelLoadingError = LoadingError(error: error)
            modelLoaded = false
            print("Error loading the model: \(error)")
        }
    }
    func imageClassification(image: UIImage) {
        guard modelLoaded else {
            print("Model not loaded. Unable to perform image classification.")
            return
        }
        guard let resizedImage = image.resizedTo(size: CGSize(width: 299, height: 299)),
              let buffer = resizedImage.toBuffer() else {
            return
        }
        do {
            let output = try model?.prediction(image: buffer)
            self.classificationLabel = output?.classLabel ?? ""
            if let confidence = output?.classLabelProbs[self.classificationLabel] {
                let percentage = Int(confidence * 100)
                self.confidencePercentage = "\(percentage)%"
            }
        } catch {
            print("Error classifying image: \(error)")
        }
    }
    func reset() {
        changeProfileImage = false
        openSheet = true
        showImagePicker = false
        sourceType = .camera
        imageSelected = UIImage()
        classificationLabel = ""
        confidencePercentage = ""
        modelLoaded = false
        model = nil
        modelLoadingError = nil
    }
}

struct ScanView: View {
    @StateObject private var viewModel = ScanViewModel()
    @State private var showClassificationSheet = false
    @State private var selectedAnimal = ""
    var body: some View {
        NavigationView {
            VStack {
                Image("onboarding1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 393, height: 393)
                Text("Scan your cat's or dog’s skin to know the classification of ringworm and scabies diseases")
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                    .foregroundColor(Color("PrimaryColor"))
                NavigationLink(
                    destination: ScanResult( classificationLabel: viewModel.classificationLabel, confidencePercentage: viewModel.confidencePercentage, imageSelected: viewModel.imageSelected),
                    isActive: $showClassificationSheet,
                    label: { EmptyView() }
                )
                .hidden()
            }
            .actionSheet(isPresented: $viewModel.openSheet) {
                ActionSheet(title: Text("Choose Media"), buttons: [
                    .default(Text("Camera")) {
                        viewModel.showImagePicker = true
                        viewModel.changeProfileImage = true
                        viewModel.sourceType = .camera
                    },
                    .default(Text("Photo Library")) {
                        viewModel.showImagePicker = true
                        viewModel.changeProfileImage = true
                        viewModel.sourceType = .photoLibrary
                    },
                    .cancel()
                ])
            }
            .sheet(isPresented: $viewModel.showImagePicker) {
                ImagePicker(selectedImage: $viewModel.imageSelected, sourceType: viewModel.sourceType)
                    .onDisappear {
                        viewModel.imageClassification(image: viewModel.imageSelected)
                        showClassificationSheet = true
                    }
            }
            .onAppear {
                viewModel.reset()
                viewModel.loadModel()
            }
            .alert(item: $viewModel.modelLoadingError) { error in
                Alert(title: Text("Error"), message: Text(error.error.localizedDescription), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
