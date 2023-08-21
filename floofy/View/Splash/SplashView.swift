//
//  SplashView.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 06/06/23.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    @AppStorage("sign_in") var wasSigned: Bool = false
    var body: some View {
        ZStack {
            Color(red: 216 / 255, green: 31 / 255, blue: 98 / 255)
                .ignoresSafeArea()
            if self.isActive {
                if wasSigned {
                    ContentView()
                } else {
                    OnboardingView()
                }
            } else {
                Image("splashImage")
                    .resizable()
                    .frame(width: 222, height: 149)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() +  1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
