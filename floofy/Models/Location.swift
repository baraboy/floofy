//
//  Location.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 24/08/23.
//

import Foundation

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
}
