//
//  TextFieldClearButton.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 08/06/23.
//

import Foundation
import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    func body(content: Content) -> some View {
        HStack {
            content
            if !text.isEmpty {
                Button {
                    self.text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
            }
        }
    }
}
