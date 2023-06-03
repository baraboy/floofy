//
//  floofyApp.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 27/05/23.
//

import SwiftUI

@main
struct floofyApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
