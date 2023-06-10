//
//  ScanResult.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 10/06/23.
//

import SwiftUI

struct ScanResult: View {
    var classificationLabel: String
    var confidencePercentage: String
    var imageSelected: UIImage
    @Binding var selectedAnimal: String
    
    
    var body: some View {

        VStack {
            
            Image(uiImage: imageSelected)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text("\(classificationLabel)")
                .font(.title3)
            
            Text("Classification: \(confidencePercentage) \(classificationLabel)")
                .padding()
            
            Text("The image of \(selectedAnimal) above has a classification of \(classificationLabel) (\(confidencePercentage)), you should take \(selectedAnimal) to the vet.")
                .padding()
            
            Text("If you want to know more about what \(classificationLabel) is, you can read it through the article.")
                .padding()
            
            Text("Veterinarian Location: ")
                .bold()
            
            LocationListView()
        }
        .padding()
        
    }
}

struct ScanResult_Previews: PreviewProvider {
    static var previews: some View {
        ScanResult(
            classificationLabel: "Cat",
            confidencePercentage: "80%",
            imageSelected: UIImage(),
            selectedAnimal: .constant("Hengki")
        )
    }
}

