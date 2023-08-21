//
//  CircleViewBadge.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 21/08/23.
//

import Foundation
import SwiftUI

struct CircleViewBadge: View {
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
