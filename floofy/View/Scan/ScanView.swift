//
//  ScanView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 10/06/23.
//

import SwiftUI

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
                    destination: ScanResult( classificationLabel: viewModel.classificationLabel,
                                             confidencePercentage: viewModel.confidencePercentage,
                                             imageSelected: viewModel.imageSelected),
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
                Alert(title: Text("Error"), message: Text(error.error.localizedDescription),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
