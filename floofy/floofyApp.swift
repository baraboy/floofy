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
<<<<<<< Updated upstream
            OnboardingView()
=======
            SplashView()
>>>>>>> Stashed changes
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
