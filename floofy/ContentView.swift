//
//  ContentView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 27/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack{
            TabView(){
                ChallengeView()
                    .tabItem{
                        Image(systemName: "gamecontroller")
                        Text("Missions")
                    }
                    .tag(0)
                ScanView()
                    .tabItem{
                        Image(systemName: "camera.viewfinder")
                        Text("Scan")
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
