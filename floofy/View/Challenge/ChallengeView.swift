//
//  ChallengeView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 10/06/23.
//

import SwiftUI
import CoreData

struct ChallengeView: View {
    
    @State private var showView = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) private var pets: FetchedResults<PetsItem>
    
//    @State var petSelected: PetsItem
//    
//    init(moc: NSManagedObjectContext) {
//        let fetchRequest: NSFetchRequest<PetsItem> = PetsItem.fetchRequest()
//        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \PetsItem.name_pets, ascending: true)]
//        fetchRequest.predicate = NSPredicate(value: true)
//        self._pets = FetchRequest(fetchRequest: fetchRequest)
//        
//        do {
//            let namePet = try moc.fetch(fetchRequest)
//            self._petSelected = State(initialValue: namePet[0])
//        } catch {
//            fatalError("Uh, fetch problem")
//        }
//    }
    
    var body: some View {
        
            NavigationStack {
                
                VStack(spacing: 25) {
                    Button {
                        showView.toggle()
                    }label: {
                        
                        // Cardview pertama
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke(CustomColor.primaryColor, lineWidth: 2)
                            .frame(width: 359, height: 73)
                            .overlay(
                                
                                HStack {
                                    ZStack {
                                        Circle()
                                            .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                            .frame(width: 43, height: 41)
                                            .padding(.leading, 10)
                                        
                                        Image("bathBadges1")
                                            .resizable()
                                            .frame(width:25, height: 25)
                                            .padding(.leading, 10)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Bathe your pet 3 times!")
                                            .font(.system(size: 17, weight: .bold))
                                            .foregroundColor(.black)
                                        
                                        HStack {
                                            ZStack(alignment: .leading) {
                                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                    .fill(CustomColor.challengeFirstColor)
                                                    .frame(width: 247, height: 10)
                                                
                                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                    .fill(CustomColor.challengeSecondColor)
                                                    .frame(width: 177, height: 10)
                                            }
                                            
                                            Text("2/3")
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(CustomColor.primaryColor)
                                        }
                                    }
                                }
                                    .padding(.trailing,10)
                            )
                    }
                    .sheet(isPresented: $showView) {
                        GroomingInputView(moc: moc)
                    }
                    
                    VStack(spacing: 25) {
                        
                        
                        
                        
                        // Cardview kedua
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke(CustomColor.primaryColor, lineWidth: 2)
                            .frame(width: 359, height: 73)
                            .overlay(
                                
                                HStack {
                                    ZStack {
                                        Circle()
                                            .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                            .frame(width: 43, height: 41)
                                            .padding(.leading, 10)
                                        
                                        Image("cleanBadges1")
                                            .resizable()
                                            .frame(width:25, height: 25)
                                            .padding(.leading, 10)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Clean the cage 3 times!")
                                            .font(.system(size: 17, weight: .bold))
                                        
                                        HStack {
                                            ZStack(alignment: .leading) {
                                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                    .fill(CustomColor.challengeFirstColor)
                                                    .frame(width: 247, height: 10)
                                                
                                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                    .fill(CustomColor.challengeSecondColor)
                                                    .frame(width: 100, height: 10)
                                            }
                                            
                                            Text("1/3")
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(CustomColor.primaryColor)
                                        }
                                    }
                                }
                                    .padding(.trailing,10)
                            )
                        
                        
                        Text("Special Missions")
                            .font(.system(size: 17, weight: .semibold))
                        
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke(CustomColor.primaryColor, lineWidth: 2)
                            .frame(width: 359, height: 73)
                            .overlay(
                                
                                HStack {
                                    ZStack {
                                        Circle()
                                            .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                            .frame(width: 43, height: 41)
                                            .padding(.leading, 10)
                                        
                                        Image("specialMissionBadges")
                                            .resizable()
                                            .frame(width:25, height: 25)
                                            .padding(.leading, 10)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Clean the cage 2 times a week")
                                            .font(.system(size: 17, weight: .bold))
                                        
                                        HStack {
                                            ZStack(alignment: .leading) {
                                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                    .fill(CustomColor.challengeFirstColor)
                                                    .frame(width: 247, height: 10)
                                                
                                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                    .fill(CustomColor.challengeSecondColor)
                                                    .frame(width: 123, height: 10)
                                            }
                                            
                                            Text("1/2")
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(CustomColor.primaryColor)
                                        }
                                    }
                                }
                                    .padding(.trailing,10)
                            )
                        
                        
                        Spacer()
                        
                    }
                }
                
                
                .navigationTitle("Missions")
                .toolbar(content: {
                    
                                    ToolbarItem(placement: .navigationBarTrailing) {
                    
                                        NavigationLink(destination: BadgesView()) {
                                            Text("Badges")
                                        }
                                    }
    //                ToolbarItem(placement: .navigationBarLeading) {
    //                    Image(uiImage: UIImage(data: petSelected.image_pets ?? Data()) ?? UIImage())
    //                }
                }
                )
            }
        

    }
}

//struct ChallengeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChallengeView()
//    }
//}
