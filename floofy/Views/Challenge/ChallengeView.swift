//
//  ChallengeView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 10/06/23.
//

import SwiftUI
import CoreData

struct ChallengeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) private var pets: FetchedResults<PetsItem>
    @FetchRequest(sortDescriptors: []) private var grooming: FetchedResults<CobaItem>
    @State private var showView = false
    @State private var countCoreDataCoba: Int = 0
    @State private var alertType: AlertType = .none
    @State private var showingFirstAlert: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Button {
                    if countCoreDataCoba < 3 {
                        if pets.isEmpty {
                            showingFirstAlert.toggle()
                            alertType = .alertNotification
                        } else {
                            showView.toggle()
                            countCoreDataCoba = grooming.count
                        }
                    } else {
                        showingFirstAlert.toggle()
                        alertType = .alert
                        countCoreDataCoba = 3
                    }
                }label: {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(CustomColor.primaryColor, lineWidth: 2)
                        .frame(width: 359, height: 73)
                        .overlay(
                            HStack {
                                if countCoreDataCoba == 1 {
                                    CardViewItem(title: "Bathe your pet 3 times!", imageName: "bathBadges1", widthFrameNumber: 100, textNumberCount: "1/3")
                                } else if countCoreDataCoba == 2 {
                                    CardViewItem(title: "Bathe your pet 3 times!", imageName: "bathBadges2", widthFrameNumber: 177, textNumberCount: "2/3")
                                } else if countCoreDataCoba == 3 {
                                    CardViewItem(title: "Bathe your pet 3 times!", imageName: "bathBadges3", widthFrameNumber: 247, textNumberCount: "3/3")
                                } else if countCoreDataCoba == 0 {
                                    CardViewItem(title: "Bathe your pet 3 times!", imageName: "bathBadges1", widthFrameNumber: 0, textNumberCount: "0/3")
                                }
                            }
                                .padding(.trailing, 10)
                        )
                }
                .alert(isPresented: $showingFirstAlert) {
                    if alertType == .alertNotification {
                        return Alert(title: Text("Warning!"), message: Text("You have to input the pets first!"), dismissButton: .default(Text("Got it!").foregroundColor(CustomColor.primaryColor)))
                    } else {
                        return Alert(title: Text("Congratulations!"), message: Text("Completed the mission \"Bathe your pet 3 times\" New Badge Unlocked"), dismissButton: .default(Text("OK").foregroundColor(CustomColor.primaryColor)))
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
                                CardViewItem(title: "Clean the cage 3 times1", imageName: "cleanBadges1", widthFrameNumber: 100, textNumberCount: "1/3")
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
                                CardViewItem(title: "Clean the cage 2 times a week", imageName: "specialMissionBadges", widthFrameNumber: 123, textNumberCount: "1/2")
                            }
                        )
                    Spacer()
                }
            }
            .onChange(of: showView) { _ in
                countCoreDataCoba = grooming.count
            }
            .onAppear {
                countCoreDataCoba = grooming.count
            }
            .navigationTitle("Missions")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: BadgesView()) {
                        Text("Badges")
                    }
                }
            }
            )
        }
    }
}
