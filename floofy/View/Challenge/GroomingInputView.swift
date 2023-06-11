//
//  GroomingInputView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 10/06/23.
//

import SwiftUI
import PhotosUI
import CoreData

struct GroomingInputView: View {
    
    @State var textTextfield = ""
    
    @FetchRequest(sortDescriptors: []) private var pets: FetchedResults<PetsItem>
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.dismiss) var dismiss
    
    @State var petSelected: PetsItem
    
    init(moc: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<PetsItem> = PetsItem.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \PetsItem.name_pets, ascending: true)]
        fetchRequest.predicate = NSPredicate(value: true)
        self._pets = FetchRequest(fetchRequest: fetchRequest)
        
        do {
            let namePet = try moc.fetch(fetchRequest)
            self._petSelected = State(initialValue: namePet[0])
        } catch {
            fatalError("Uh, fetch problem")
        }
    }
    
    
    @State private var repeatReminderIndex = 0
    var repeatReminderSelection = ["Weekly", "Monthly"]
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    
    var body: some View {
        
        VStack() {
            Spacer()
            HStack {
                Text("Grooming")
                    .font(.title2)
                Spacer()
            }
            .padding(.leading, 35)
            
            Spacer()
            
            VStack(spacing: 5) {
                
                if selectedImageData == nil {
                    Image("imagePlusRectangle")
                        .resizable()
                        .frame(width: 117, height: 114)
                    
                } else {
                    if let selectedImageData,
                       let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 210, height: 178)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                
                Text(Date(), style: .date)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray)
                
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        Text("Add Photo")
                            .font(.system(size: 17, weight: .semibold))
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
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.leading, 20)
                
                TextField("Test", text: self.$textTextfield, axis: .vertical)
                    .background(RoundedRectangle(cornerRadius:8, style: .continuous).stroke(CustomColor.primaryColor, lineWidth: 3)).padding(.leading, 30).padding(.trailing, 30)
                    .lineLimit(5, reservesSpace: true)
                
                Form {
                    Section() {
                        Picker(selection: $petSelected, label: Text("Pet")) {
                            ForEach(pets, id: \.self) { pet in
                                Text(pet.name_pets ?? "Unknown")
                                    .tag(pet)
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .frame(width: 420,height: 100)
                .shadow(radius: 3)
            }
            
            Spacer()
            
            
            CustomButton(text: "Done") {
                
                saveToCoreData()
                
                dismiss()
            }
            .disabled(textTextfield.isEmpty)
            
            
            
            
            Spacer()
        }
    }
    
    func saveToCoreData() {
        let activity = CobaItem(context: moc)
        activity.date_coba = Date()
        activity.description_coba = textTextfield
        activity.image_coba = selectedImageData
        
        petSelected.addToActivity(activity)
        
        do {
            try? moc.save()
        } catch {
            fatalError("Error: \(error.localizedDescription)")
        }
    }
}

//struct GroomingInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroomingInputView(moc: moc)
//    }
//}
