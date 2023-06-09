//
//  DetailPetView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 09/06/23.
//

import SwiftUI
import CoreData

struct DetailPetView: View {
    
//    @Binding var moveToReminderView: Bool
    
    @FetchRequest(sortDescriptors: []) var pets: FetchedResults<PetsItem>

    
    @State var selectionPet: PetsItem
    
    init(moc: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<PetsItem> = PetsItem.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \PetsItem.name_pets, ascending: true)]
        fetchRequest.predicate = NSPredicate(value: true)
        self._pets = FetchRequest(fetchRequest: fetchRequest)
        
        do {
            let namePet = try moc.fetch(fetchRequest)
            self._selectionPet = State(initialValue: namePet[0])
        } catch {
            fatalError("Uh, fetch problem")
        }
    }
    
    var body: some View {
        NavigationStack {
            
            ScrollView(showsIndicators: true) {
                VStack(spacing: 15) {
                    ZStack() {
                        
                        Image(uiImage: UIImage(data: selectionPet.image_pets ?? Data()) ?? UIImage())
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                        
                        
                        Circle()
                            .strokeBorder(Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255),lineWidth: 2)
                            .frame(width: 180, height: 178)
                        
                    }
                    
                    Text("Edit Profile")
                        .font(.system(size: 17, weight: .semibold))
                    
                    VStack(alignment: .leading) {
                        
                        Text("Scan")
                            .font(.system(size: 17, weight: .semibold))
                            .padding(.leading, 15)
                            
                        
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .stroke(Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255), lineWidth: 2)
                                .frame(width: 359, height: 152)
                            
                            List {
                                HStack() {
                                    Image("article_image2")
                                        .resizable()
                                        .frame(width: 66, height: 52)
                                        .scaledToFit()
                                    
                                    
                                    
                                    VStack(alignment: .leading) {
                                        Text("Scan 1")
                                            .font(.system(size: 17, weight: .regular))
                                        
                                        Text("Scabies")
                                            .font(.system(size: 15, weight: .regular))
                                        
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Text("02/02/2023")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.gray)
                                }
                                
                                HStack() {
                                    Image("article_image2")
                                        .resizable()
                                        .frame(width: 66, height: 52)
                                        .scaledToFit()
                                    
                                    VStack(alignment: .leading) {
                                        Text("Scan 1")
                                            .font(.system(size: 17, weight: .regular))
                                        
                                        Text("Scabies")
                                            .font(.system(size: 15, weight: .regular))
                                        
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Text("02/02/2023")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.gray)
                                }
                                
                            }
                            .frame(width: 390,height: 210)
                            .scrollContentBackground(.hidden)
                            .padding(.bottom, 30)
                            .padding(.top, 20)
                            .padding(.trailing, 5)

                        }
                    }
                    Spacer()
                }
            }
            
            .navigationTitle("Meong Activities")
            .listStyle(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    NavigationLink(destination: ReminderView()) {
                        Text("Reminders")
                    }
                    
                }
            }
        }
        
    }
}

//struct DetailPetView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        DetailPetView()
//
//    }
//}