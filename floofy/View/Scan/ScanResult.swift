//
//  ScanResult.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 10/06/23.
//

import SwiftUI

struct ScanResult: View {
    @Environment(\.presentationMode) var presentationMode
    
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
            
            Picker("Select Animal", selection: $selectedAnimal) {
                Text("Hengki").tag("Hengki")
                Text("Happy").tag("Happy")
                Text("Scoopy").tag("Scoopy")
            }
            
            Text("\(classificationLabel)")
                .font(.headline)
                .padding(.bottom,1)
            
            Text("Classification: \(confidencePercentage) \(classificationLabel)")
                .padding(.bottom,1)
            
            Text("The image of \(selectedAnimal) above has a classification of \(classificationLabel) (\(confidencePercentage)), you should take \(selectedAnimal) to the vet.")
                .multilineTextAlignment(.leading)
                .padding(.bottom, 1)
            
            Text("If you want to know more about what \(classificationLabel) is, you can read it through the article.")
                .multilineTextAlignment(.leading)
                .padding(.bottom, 1)
            HStack{
                Text("Veterinarian Location: ")
                    .bold()
                    .padding(.leading)
                Spacer()
            }
            
            LocationListView()
        }
        .padding()
        .navigationBarTitle("Classification Result")
        .navigationBarItems(trailing: doneButton)
    }
    private var doneButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Done")
        }
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

