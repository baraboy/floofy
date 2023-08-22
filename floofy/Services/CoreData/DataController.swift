//
//  DataController.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 03/06/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Reminder")

    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
