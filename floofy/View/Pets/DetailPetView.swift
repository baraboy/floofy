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
                        
                        Text("Grooming")
                            .font(.system(size: 17, weight: .semibold))
                            .padding(.leading, 15)
                            .foregroundColor(.black)
                        
                        
                        
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
                                                        Text("Grooming")
                                                            .font(.system(size: 17, weight: .bold))
                                                            .foregroundColor(.black)
                                                        
                                                        Text(activityPet.description_coba ?? "Unknown")
                                                            .font(.system(size: 15, weight: .regular))
                                                            .foregroundColor(.black)
                                                        

                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    Text(activityPet.date_coba ?? Date(), style: .date)
                                                        .font(.system(size: 12, weight: .regular))
                                                        .foregroundColor(.gray)
                                                    
                                                
                                                
                                            }
                                            
                                            
                                        }
                                    }
                                    .frame(width: 350,height: 140)
                                    .scrollContentBackground(.hidden)
                                    .padding(.bottom, 50)
                                    .padding(.top, 20)
                                    .padding(.trailing, 5)
                                    .padding(.leading, 5)
                                    .offset(y: 10)
                                
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
