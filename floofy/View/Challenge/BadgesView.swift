//
//  BadgesView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 10/06/23.
//

import SwiftUI

struct BadgesView: View {
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
                                    HStack() {
                                        
                                        Spacer()
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)
                                            
                                            Image("bathBadges1")
                                                .resizable()
                                                .frame(width:33, height: 33)
                                                .padding(.leading, 10)
                                        }
                                        
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)
                                            
                                            Image("bathBadges1")
                                                .resizable()
                                                .frame(width:33, height: 33)
                                                .padding(.leading, 10)
                                        }
                                        
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)
                                            
                                            Image("bathBadges1")
                                                .resizable()
                                                .frame(width:33, height: 33)
                                                .padding(.leading, 10)
                                        }
                                        
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)
                                            
                                            Image("bathBadges1")
                                                .resizable()
                                                .frame(width:33, height: 33)
                                                .padding(.leading, 10)
                                        }
                                        
                                        
                                        
                                        
                                        
                                        Spacer()
                                    }
                                    .padding(.top, 10)
                                    
                                    HStack() {
                                        
                                        Spacer()
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)
                                            
                                            Image("bathBadges1")
                                                .resizable()
                                                .frame(width:33, height: 33)
                                                .padding(.leading, 10)
                                        }
                                        
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)
                                            
                                            Image("bathBadges1")
                                                .resizable()
                                                .frame(width:33, height: 33)
                                                .padding(.leading, 10)
                                        }
                                        
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)
                                            
                                            Image("bathBadges1")
                                                .resizable()
                                                .frame(width:33, height: 33)
                                                .padding(.leading, 10)
                                        }
                                        
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)
                                            
                                            Image("bathBadges1")
                                                .resizable()
                                                .frame(width:33, height: 33)
                                                .padding(.leading, 10)
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
                                    
                                    HStack() {
                                        
                                        Spacer()
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)
                                            
                                            Image("bathBadges1")
                                                .resizable()
                                                .frame(width:33, height: 33)
                                                .padding(.leading, 10)
                                        }
                                        
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)
                                            
                                            Image("bathBadges1")
                                                .resizable()
                                                .frame(width:33, height: 33)
                                                .padding(.leading, 10)
                                        }
                                        
                                        ZStack {
                                            Circle()
                                                .strokeBorder(CustomColor.primaryColor,lineWidth: 2)
                                                .frame(width: 55, height: 52)
                                                .padding(.leading, 10)
                                            
                                            Image("bathBadges1")
                                                .resizable()
                                                .frame(width:33, height: 33)
                                                .padding(.leading, 10)
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
