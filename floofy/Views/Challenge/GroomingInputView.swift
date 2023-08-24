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
    @FetchRequest(sortDescriptors: []) private var pets: FetchedResults<PetsItem>
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var petSelected: PetsItem
    @State private var selectedItem: PhotosPickerItem?
    @State private var textTextfield = ""
    @State private var selectedImageData: Data?
    @State private var repeatReminderIndex = 0
    var repeatReminderSelection = ["Weekly", "Monthly"]
    init(moc: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<PetsItem> = PetsItem.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \PetsItem.namePets, ascending: true)]
        fetchRequest.predicate = NSPredicate(value: true)
        self._pets = FetchRequest(fetchRequest: fetchRequest)
        do {
            let namePet = try moc.fetch(fetchRequest)
            self._petSelected = State(initialValue: namePet[0])
        } catch {
            fatalError("Uh, fetch problem")
        }
    }
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Grooming")
                    .font(.title2)
                    .foregroundColor(.black)
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
                    .foregroundColor(.black)
                TextField("Text the description Here", text: self.$textTextfield, axis: .vertical)
                    .background(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(CustomColor.primaryColor, lineWidth: 3)).padding(.leading, 30).padding(.trailing, 30)
                    .foregroundColor(.black)
                    .lineLimit(5, reservesSpace: true)
                Form {
                    Section {
                        Picker(selection: $petSelected, label: Text("Pet").foregroundColor(.black)) {
                            ForEach(pets, id: \.self) { pet in
                                Text(pet.namePets ?? "Unknown")
                                    .tag(pet)
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .frame(width: 420, height: 100)
                .shadow(radius: 3)
            }
            Spacer()
            CustomButtonView(text: "Done") {
                saveToCoreData()
                dismiss()
            }
            .disabled(textTextfield.isEmpty)
            .disabled(selectedImageData?.isEmpty ?? true )
            Spacer()
        }
    }
    func saveToCoreData() {
        let activity = CobaItem(context: moc)
        activity.dateGrooming = Date()
        activity.descriptionGrooming = textTextfield
        activity.imageGrooming = selectedImageData
        petSelected.addToActivity(activity)
        do {
            try? moc.save()
        }
    }
}

/*
 struct GroomingInputView_Previews: PreviewProvider {
 static var previews: some View {
 GroomingInputView(moc: moc)
 }
 }
 */
