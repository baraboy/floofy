//
//  BadgesView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 10/06/23.
//

import SwiftUI

struct BadgesView: View {

    @State var countCoreDataCoba: Int = 0
    @FetchRequest(sortDescriptors: []) private var petActivity: FetchedResults<PetActivityItem>

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Reguler")
                            .font(.system(size: 17, weight: .bold))

                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke(CustomColor.primaryColor, lineWidth: 2)
                            .frame(width: 359, height: 177)
                            .overlay(
                                VStack(spacing: 30) {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        BadgesItemView(count: petActivity.count, nameLockImage: "lockBadges1", nameBadges: "bathBadges1")
                                        BadgesItemView(count: petActivity.count, nameLockImage: "lockBadges2", nameBadges: "bathBadges2")
                                        BadgesItemView(count: petActivity.count, nameLockImage: "lockBadges3", nameBadges: "bathBadges3")
                                        BadgesItemView(count: petActivity.count, nameLockImage: "lockBadges4", nameBadges: "bathBadges4")
                                        Spacer()
                                    }
                                    .padding(.top, 10)

                                    HStack {
                                        Spacer()
                                        BadgesItemView(count: petActivity.count, nameLockImage: "lockBadges5", nameBadges: "bathBadges5")
                                        BadgesItemView(count: petActivity.count, nameLockImage: "lockBadges6", nameBadges: "bathBadges6")

                                        Spacer()
                                    }

                                    Spacer()
                                }
                            )
                    }
                    Spacer()
                }

                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Special")
                            .font(.system(size: 17, weight: .bold))

                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke(CustomColor.primaryColor, lineWidth: 2)
                            .frame(width: 359, height: 86)
                            .overlay(
                                VStack(spacing: 30) {
                                    HStack {
                                        Spacer()
                                        BadgesItemView(count: petActivity.count, nameLockImage: "lockBadges4", nameBadges: "bathBadges4")
                                        BadgesItemView(count: petActivity.count, nameLockImage: "lockBadges4", nameBadges: "bathBadges4")
                                        BadgesItemView(count: petActivity.count, nameLockImage: "lockBadges4", nameBadges: "bathBadges4")

                                        Spacer()
                                    }
                                    .padding(.top, 30)

                                    Spacer()
                                }
                            )
                    }
                    Spacer()
                }
            }
            .accentColor(Color("PrimaryColor"))
            .padding(.leading, 10)

            Spacer()
                .navigationTitle("Badges")

        }

    }
}

struct BadgesView_Previews: PreviewProvider {
    static var previews: some View {
        BadgesView()
    }
}
