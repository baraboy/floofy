//
//  LocationListView.swift
//  profileImage
//
//  Created by Rizky Dwi Hadisaputro on 09/06/23.
//

import SwiftUI
import CoreLocation
import MapKit

struct LocationListView: View {
    @StateObject private var locationManager = LocationManager()
    let locations: [Location] = [
        Location(name: "Petshop & poultryshop by Klinik Hewan Waras Satwa", latitude: 1.107559, longitude: 104.091204),
        Location(name: "Klinik Hewan Waras Satwa Batam", latitude: 1.143835, longitude: 104.049366),
        Location(name: "De'Chruse Pet Center Batam", latitude: 1.132848, longitude: 104.036012),
        Location(name: "Dunia Kucing", latitude: 1.133117, longitude: 104.043692),
        Location(name: "Bruno Pet Clinic", latitude: 1.107559, longitude: 104.015769),
        Location(name: "Berastagi Pets Clinic", latitude: 1.154125, longitude: 104.003198),
        Location(name: "Drh Suadnyana Winaya Made", latitude: 1.114162, longitude: 103.981689),
        Location(name: "Drh Catur Isnandar", latitude: 1.114762, longitude: 103.978697),
        Location(name: "OJ Pet Care", latitude: 1.112519, longitude: 103.974510),
        Location(name: "drh Samuel Tampubolon", latitude: 1.107682, longitude: 103.969359),
        Location(name: "DOME VET CENTER", latitude: 1.046945, longitude: 103.931097),
        Location(name: "Cakrawala Pets Clinic", latitude: 1.046353, longitude: 103.930785),
        Location(name: "PARAMA Pet Care", latitude: 1.034647, longitude: 103.997852)
    ]
    var sortedLocations: [Location] {
        guard locationManager.currentLocation != nil else {
            return locations
        }
        return locations.sorted { (location1, location2) -> Bool in
            guard let distance1 = locationManager.distanceFromDevice(to: location1),
                  let distance2 = locationManager.distanceFromDevice(to: location2) else {
                return false
            }
            return distance1 < distance2
        }
    }
    var body: some View {
        List(sortedLocations) { location in
            LocationListItemView(location: location, locationManager: locationManager)
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
