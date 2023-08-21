//
//  floofyApp.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 27/05/23.
//

import SwiftUI

@main
struct FloofyApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
