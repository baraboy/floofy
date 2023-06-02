//
//  ContentView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 27/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            Text("Scan Tab")
                .tabItem{
                    Image(systemName: "camera.viewfinder")
                    Text("Scan")
                }
                .tag(0)
            ReminderView()
                .tabItem{
                    Image(systemName: "bell")
                    Text("Reminder")
                }
                .tag(1)
            Text("Challenges Tab")
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Challenges")
                }
                .tag(2)
            Text("Articles Tab")
                .tabItem{
                    Image(systemName: "newspaper")
                    Text("Articles")
                }
                .tag(3)
            Text("Pet Tab")
                .tabItem{
                    Image(systemName: "pawprint")
                    Text("Pet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
