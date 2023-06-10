//
//  ChallengeView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 10/06/23.
//

import SwiftUI

struct ChallengeView: View {
    
    var body: some View {
        NavigationStack {
            
            VStack() {
                
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
                            
                            VStack {
                                Text("Bathe your pet 3 times!")
                                    .font(.system(size: 17, weight: .bold))
                                
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                                        .fill(CustomColor.challengeFirstColor)
                                                    .frame(width: 247, height: 10)
                                    
                                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                                        .fill(CustomColor.challengeSecondColor)
                                                    .frame(width: 100, height: 10)
                                }
                                
                            }
                            
                            //Spacer()
                        }
                        
                    )
                
                Spacer()
                
            }
            .navigationTitle("Missions")
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
