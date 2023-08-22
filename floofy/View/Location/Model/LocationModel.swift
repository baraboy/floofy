//
//  LocationModel.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 21/08/23.
//

import Foundation

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
}
