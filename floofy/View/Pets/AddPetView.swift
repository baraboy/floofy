//
//  AddPetView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 08/06/23.
//

import SwiftUI
import PhotosUI
import CoreData

enum Pets: String, CaseIterable, Identifiable {
    case dog = "Dog"
    case cat = "Cat"
    
    var id: String { self.rawValue}
}

struct AddPetView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var pets: FetchedResults<PetsItem>
    @Environment(\.dismiss) var dismiss
    
    
    @State var namePet: String = ""
    
    @State var selectionPets: Pets = .dog
    
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 30) {
                
                VStack() {
                    
                    if selectedImageData == nil {
                        Image("addImage")
                            .resizable()
                            .frame(width: 180, height: 178)
                        
                    } else {
                        if let selectedImageData,
                           let uiImage = UIImage(data: selectedImageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 210, height: 178)
                                .clipShape(Circle())
                        }
                    }
                    
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            Text("Add Photo")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.black)
                        }
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                // Retrieve selected asset in the form of Data
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                }
                            }
                        }
                }
                
                VStack(alignment: .leading) {
                    
                    Text("Name")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.black)
                    
                    TextField("Enter the name here", text: $namePet)
                        .modifier(TextFieldClearButton(text: $namePet))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                    
                    Text("Dog/Cat?")
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.top, 10)
                        .foregroundColor(.black)
                    
                    Picker(selection: $selectionPets, label: Text("Dog/Cat?")) {
                        
                        ForEach(Pets.allCases) { pet in
                            Text(pet.rawValue.capitalized)
                                .tag(pet)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                
                Spacer()
                
                CustomButton(text: "Add Pet") {
                    
                    saveDatatoCoreData()
                }
                .disabled(namePet.isEmpty)
                
                
                Spacer()
                
            }
            .navigationTitle("Add Pet")
            
        }
        .navigationBarTitleDisplayMode(.large)
    }
    
    func saveDatatoCoreData() {
        
        let pets = PetsItem(context: moc)
        
        pets.id = UUID()
        pets.name_pets = namePet
        pets.image_pets = selectedImageData
        pets.pet_category = selectionPets.rawValue
        
        try? moc.save()
        
        dismiss()
    }
}

struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView()
    }
}
