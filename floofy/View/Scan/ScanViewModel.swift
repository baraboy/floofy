//
//  ScanViewModel.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 18/08/23.
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
