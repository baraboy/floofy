//
//  BadgesView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 10/06/23.
//

import SwiftUI

struct BadgesView: View {

    @State var countCoreDataCoba: Int = 0
    @FetchRequest(sortDescriptors: []) private var coba: FetchedResults<CobaItem>

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
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor, lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)

                                            if coba.count < 1 {
                                                Image("lockBadges1")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            } else {
                                                Image("bathBadges1")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            }
                                        }

                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor, lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)

                                            if coba.count < 2 {
                                                Image("lockBadges2")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            } else {
                                                Image("bathBadges2")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            }
                                        }

                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor, lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)

                                            if coba.count < 3 {
                                                Image("lockBadges3")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            } else {
                                                Image("bathBadges3")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            }
                                        }

                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor, lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)

                                            if coba.count < 4 {
                                                Image("lockBadges4")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            } else {
                                                Image("bathBadges4")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            }
                                        }
                                        Spacer()
                                    }
                                    .padding(.top, 10)

                                    HStack {
                                        Spacer()
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor, lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)

                                            if coba.count < 4 {
                                                Image("lockBadges5")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            } else {
                                                Image("bathBadges5")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            }
                                        }

                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor, lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)

                                            if coba.count < 4 {
                                                Image("lockBadges6")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            } else {
                                                Image("bathBadges6")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            }
                                        }

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
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor, lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)

                                            if coba.count < 4 {
                                                Image("lockBadges4")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            } else {
                                                Image("bathBadges4")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            }
                                        }

                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor, lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)

                                            if coba.count < 4 {
                                                Image("lockBadges4")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            } else {
                                                Image("bathBadges4")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            }
                                        }

                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor, lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)

                                            if coba.count < 4 {
                                                Image("lockBadges4")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            } else {
                                                Image("bathBadges4")
                                                    .resizable()
                                                    .frame(width: 33, height: 33)
                                                    .padding(.leading, 10)
                                            }
                                        }

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
