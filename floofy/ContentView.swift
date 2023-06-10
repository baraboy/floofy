//
//  ContentView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 27/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Int = 1
    
    var body: some View {
        VStack{
            TabView(selection: $selectedTab){
                ScanView()
                    .tabItem{
                        Image(systemName: "camera.viewfinder")
                        Text("Scan")
                    }
                    .tag(0)
                ChallengeView()
                    .tabItem{
                        Image(systemName: "gamecontroller")
                        Text("Challenges")
                    }
                    .tag(1)
                ArticleView()
                    .tabItem{
                        Image(systemName: "newspaper")
                        Text("Articles")
                    }
                    .tag(2)
                PetView()
                    .tabItem{
                        Image(systemName: "pawprint")
                        Text("Pet")
                    }
                    .tag(3)
            }
        }
        .preferredColorScheme(.light)
        .navigationBarBackButtonHidden()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
