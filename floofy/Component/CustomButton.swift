//
//  CustomButton.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 08/06/23.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    var text: String
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            
                Text(text)
                    .background(Color("PrimaryColor"))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(width: 300 , height: 40 ,alignment: .center)
            
        }
        .buttonStyle(.borderedProminent)
    }
}
