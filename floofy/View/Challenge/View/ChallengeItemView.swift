//
//  ChallengeItemView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 22/08/23.
//

import SwiftUI

struct ChallengeItemView: View {
    let title: String
    let imageName: String
    let widthFrameNumber: CGFloat
    let textNumberCount: String
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(CustomColor.primaryColor, lineWidth: 2)
                .frame(width: 43, height: 41)
                .padding(.leading, 10)
            Image("\(imageName)")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.leading, 10)
        }
        VStack(alignment: .leading) {
            Text("\(title)")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.black)
            HStack {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(CustomColor.challengeFirstColor)
                        .frame(width: 247, height: 10)
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(CustomColor.challengeSecondColor)
                        .frame(width: widthFrameNumber, height: 10)
                }
                Text("\(textNumberCount)")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(CustomColor.primaryColor)
            }
        }
    }
}
