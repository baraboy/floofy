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
    @Published var selectedAnimal: String = ""
    
    
    struct LoadingError: Error, Identifiable {
        let id = UUID()
        let error: Error
    }
    
    @Published var modelLoadingError: LoadingError?
    @Published var modelLoaded = false
    private var model: RingwormScabiesModel?
    
    func loadModel() {
        do {
            let configuration = MLModelConfiguration()
            model = try RingwormScabiesModel(configuration: configuration)
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
        selectedAnimal = ""
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
                
                Picker("Select Animal", selection: $selectedAnimal) {
                    Text("Hengki").tag("Hengki")
                    Text("Happy").tag("Happy")
                    Text("Scoopy").tag("Scoopy")
                }
                .pickerStyle(.menu)
                Button("View Result") {
                    viewModel.imageClassification(image: viewModel.imageSelected)
                    showClassificationSheet = true
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.green)
                
                NavigationLink(
                    destination: ScanResult(classificationLabel: viewModel.classificationLabel, confidencePercentage: viewModel.confidencePercentage, imageSelected: viewModel.imageSelected, selectedAnimal: $selectedAnimal),
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
