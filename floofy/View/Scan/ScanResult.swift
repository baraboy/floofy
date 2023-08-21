//
//  ScanResult.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 10/06/23.
//

import SwiftUI

struct ScanResult: View {

    @FetchRequest(sortDescriptors: []) private var pets: FetchedResults<PetsItem>
    var classificationLabel: String
    var confidencePercentage: String
    var imageSelected: UIImage
    @State private var showAlert = false
    @State var petSelected: PetsItem?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Image(uiImage: imageSelected)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)

            Picker(selection: $petSelected, label: Text("Pet").foregroundColor(.black)) {
                ForEach(pets, id: \.self) { pet in
                    Text(pet.namePets ?? "Unknown")
                        .tag(pet as PetsItem?)
                }
            }

            Text("\(classificationLabel)")
                .font(.headline)
                .padding(.bottom, 1)

            Text("Classification: \(confidencePercentage) \(classificationLabel)")
                .padding(.bottom, 1)

            Text("The image of \(petSelected?.namePets ?? "name cat/dog") above has a classification of \(classificationLabel) (\(confidencePercentage)), you should take \(petSelected?.namePets ?? "name cat/dog") to the vet.")
                .multilineTextAlignment(.leading)
                .padding(.bottom, 1)

            Text("If you want to know more about what \(classificationLabel) is, you can read it through the article.")
                .multilineTextAlignment(.leading)
                .padding(.bottom, 1)
            HStack {
                Text("Veterinarian Location: ")
                    .bold()
                    .padding(.leading)
                Spacer()
            }

            LocationListView()
        }
        .foregroundColor(.black)
        .padding()
        .navigationBarTitle("Classification Result")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton, trailing: doneButton)
        .onDisappear {
            if presentationMode.wrappedValue.isPresented {
                showAlert = true
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Confirmation"),
                message: Text("Are you sure you want to go back? Your progress will be deleted"),
                primaryButton: .cancel(),
                secondaryButton: .destructive(Text("Yes"), action: {
                    presentationMode.wrappedValue.dismiss()
                })
            )
        }
    }

    private var backButton: some View {
        Button {
            showAlert = true
        } label: {
            HStack(spacing: 5) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                Text("Back")
            }
        }
    }

    private var doneButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Done")
        }
    }
}

struct ScanResult_Previews: PreviewProvider {
    static var previews: some View {
        ScanResult(
            classificationLabel: "Cat",
            confidencePercentage: "80%",
            imageSelected: UIImage()
        )
    }
}
