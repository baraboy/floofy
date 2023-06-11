//
//  ChallengeView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 10/06/23.
//

import SwiftUI
import CoreData

struct ChallengeView: View {
    
    enum AlertType {
            case alert1
            case alert2
            case none
        }
    
    @State private var showView = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) private var pets: FetchedResults<PetsItem>
    
    @FetchRequest(sortDescriptors: []) private var coba: FetchedResults<CobaItem>
    
    @State var countCoreDataCoba: Int = 0
    
    @State private var showingFirstAlert: Bool = false
    @State private var showingAlert2 = false
    @State var alertType: AlertType = .none
        
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 25) {
                Button {
                    
                    if countCoreDataCoba < 3 {
                        
                        if pets.isEmpty {
                            showingFirstAlert.toggle()
                            alertType = .alert1
                        } else {
                            showView.toggle()
                        }
                        
                    } else {
                        showingFirstAlert.toggle()
                        alertType = .alert2
                        countCoreDataCoba = 3
                    }
                    
                }label: {
                    
                    // Cardview pertama
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(CustomColor.primaryColor, lineWidth: 2)
                        .frame(width: 359, height: 73)
                        .overlay(
                            
                            HStack {
                                
                                if countCoreDataCoba == 1 {
                                    
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
                                                    .frame(width: 100, height: 10)
                                            }
                                            
                                            Text("1/3")
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(CustomColor.primaryColor)
                                        }
                                    }
                                } else if countCoreDataCoba == 2 {
                                    
                                    ZStack {
                                        Circle()
                                            .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                            .frame(width: 43, height: 41)
                                            .padding(.leading, 10)
                                        
                                        
                                        Image("bathBadges2")
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
                                } else if countCoreDataCoba == 3 {
                                    
                                    ZStack {
                                        Circle()
                                            .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                            .frame(width: 43, height: 41)
                                            .padding(.leading, 10)
                                        
                                        
                                        Image("bathBadges3")
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
                                                    .frame(width: 247, height: 10)
                                            }
                                            
                                            Text("3/3")
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(CustomColor.primaryColor)
                                        }
                                    }
                                } else if countCoreDataCoba == 0 {
                                    
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
                                                    .frame(width: 0, height: 10)
                                            }
                                            
                                            Text("0/3")
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundColor(CustomColor.primaryColor)
                                        }
                                    }
                                }
                                
                                
                            }
                                .padding(.trailing,10)
                        )
                }
                
                .alert(isPresented: $showingFirstAlert) {
                    
                    if alertType == .alert1 {
                         return Alert(title: Text("Warning!"), message: Text("You have to input the pets first!"), dismissButton: .default(Text("Got it!").foregroundColor(CustomColor.primaryColor)))
                    } else {
                        return Alert(title: Text("Congratulations!"), message: Text("Completed the mission \"Bathe your pet 3 times\" New Badge Unlocked"), dismissButton: .default(Text("OK").foregroundColor(CustomColor.primaryColor)))
                    }
                    
                }
                
//                .alert(isPresented: $showingAlert2) {
//                    Alert(title: Text("Congratulations!"), message: Text("Completed the mission \"Bathe your pet 3 times\" New Badge Unlocked"), dismissButton: .default(Text("OK").foregroundColor(CustomColor.primaryColor)))
//                }
                
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
                        .foregroundColor(.black)
                    
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
            
            .onAppear {
                countCoreDataCoba = coba.count
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
