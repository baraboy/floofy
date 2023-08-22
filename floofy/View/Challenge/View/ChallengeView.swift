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
    @FetchRequest(sortDescriptors: []) private var petActivity: FetchedResults<PetActivityItem>
    @State var countPetActivity: Int = 0
    @State private var showingFirstAlert: Bool = false
    @State var alertType: AlertType = .none

    var body: some View {

        NavigationStack {
            VStack(spacing: 25) {
                Button {
                    if countPetActivity < 3 {
                        if pets.isEmpty {
                            showingFirstAlert.toggle()
                            alertType = .alert1
                        } else {
                            showView.toggle()
                            countPetActivity = petActivity.count
                        }
                    } else {
                        showingFirstAlert.toggle()
                        alertType = .alert2
                        countPetActivity = 3
                    }

                } label: {
                    // Cardview pertama
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(CustomColor.primaryColor, lineWidth: 2)
                        .frame(width: 359, height: 73)
                        .overlay(
                            HStack {
                                if countPetActivity == 1 {
                                    ChallengeItemView(title: "Bathe your pet 3 times!", imageName: "bathBadges1", widthFrameNumber: 100, textNumberCount: "1/3")
                                } else if countPetActivity == 2 {
                                    ChallengeItemView(title: "Bathe your pet 3 times!", imageName: "bathBadges2", widthFrameNumber: 177, textNumberCount: "2/3")
                                } else if countPetActivity == 3 {
                                    ChallengeItemView(title: "Bathe your pet 3 times!", imageName: "bathBadges3", widthFrameNumber: 247, textNumberCount: "3/3")
                                } else if countPetActivity == 0 {
                                    ChallengeItemView(title: "Bathe your pet 3 times!", imageName: "bathBadges1", widthFrameNumber: 0, textNumberCount: "0/3")
                                }
                            }
                                .padding(.trailing, 10)
                        )
                }
                .alert(isPresented: $showingFirstAlert) {

                    if alertType == .alert1 {
                        return Alert(title: Text("Warning!"),
                                     message: Text("You have to input the pets first!"),
                                     dismissButton: .default(Text("Got it!").foregroundColor(CustomColor.primaryColor)))
                    } else {
                        return Alert(title: Text("Congratulations!"),
                                     message: Text("Completed the mission \"Bathe your pet 3 times\" New Badge Unlocked"),
                                     dismissButton: .default(Text("OK").foregroundColor(CustomColor.primaryColor)))
                    }

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
                                ChallengeItemView(title: "Clean the cage 3 times1", imageName: "cleanBadges1", widthFrameNumber: 100, textNumberCount: "1/3")
                            }
                            .padding(.trailing, 10)
                        )

                    Text("Special Missions")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.black)

                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(CustomColor.primaryColor, lineWidth: 2)
                        .frame(width: 359, height: 73)
                        .overlay(
                            HStack {
                                ChallengeItemView(title: "Clean the cage 2 times a week", imageName: "specialMissionBadges", widthFrameNumber: 123, textNumberCount: "1/2")
                            }
                            .padding(.trailing, 10)
                        )
                    Spacer()
                }
            }
            .onChange(of: showView) { _ in
                countPetActivity = petActivity.count
            }
            .onAppear {
                countPetActivity = petActivity.count
            }
            .navigationTitle("Missions")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: BadgesView()) {
                        Text("Badges")
                    }
                }
            })
        }
    }
}
