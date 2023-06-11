//
//  DetailPetView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 09/06/23.
//

import SwiftUI
import CoreData

struct DetailPetView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @StateObject var selectionPet: PetsItem
    
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
                            .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
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
                                .stroke(CustomColor.primaryColor, lineWidth: 2)
                                .frame(width: 359, height: 152)
                                .overlay(
                                
                                    List {
                                        
                                        ForEach(selectionPet.activityArray) { activityPet in
                                            
                                            HStack() {
                                                    
                                                    Image(uiImage: UIImage(data: activityPet.image_coba ?? Data()) ?? UIImage())
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
                                                    
                                                    Text(activityPet.date_coba ?? Date(), style: .date)
                                                        .font(.system(size: 12, weight: .regular))
                                                        .foregroundColor(.gray)
                                                    
                                                
                                                
                                            }
                                            
                                            
                                        }
                                    }
                                    .frame(width: 390,height: 180)
                                    .scrollContentBackground(.hidden)
                                    .padding(.bottom, 30)
                                    .padding(.top, 20)
                                    .padding(.trailing, 5)
                                
                                )
                            

                        }
                    }
                    Spacer()
                }
            }
            
            .navigationTitle("Meong Activities")
            .listStyle(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    NavigationLink(destination: ReminderView(pet: selectionPet)) {
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
