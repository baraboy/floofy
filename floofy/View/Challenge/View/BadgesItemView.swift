//
//  BadgesItemView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 22/08/23.
//

import SwiftUI

struct BadgesItemView: View {
    let count: Int
    let nameLockImage: String
    let nameBadges: String
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(CustomColor.primaryColor, lineWidth: 2)
                .frame(width: 55, height: 52)
                .padding(.leading, 10)
            if count < 1 {
                Image("\(nameLockImage)")
                    .resizable()
                    .frame(width: 33, height: 33)
                    .padding(.leading, 10)
            } else {
                Image("\(nameBadges)")
                    .resizable()
                    .frame(width: 33, height: 33)
                    .padding(.leading, 10)
            }
        }
    }
}
