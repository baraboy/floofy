//
//  LocationListItemView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 21/08/23.
//

import SwiftUI
import CoreLocation
import MapKit

struct LocationListItemView: View {
    var location: Location
    @ObservedObject var locationManager: LocationManager
    var body: some View {
        VStack(alignment: .leading) {
            Text(location.name)
            if let distance = locationManager.distanceFromDevice(to: location) {
                Text(String(format: "Distance: %.2f km", distance / 1000))
                    .font(.caption)
            }
            Button("Directions") {
                openMapsAppWithDirections(to: location)
            }
            .foregroundColor(Color("PrimaryColor"))
        }
    }
    private func openMapsAppWithDirections(to location: Location) {
        guard let currentLocation = locationManager.currentLocation else {
            // Handle case when current location is not available
            return
        }
        let startCoordinate = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        let endCoordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let startPlacemark = MKPlacemark(coordinate: startCoordinate)
        let endPlacemark = MKPlacemark(coordinate: endCoordinate)
        let startItem = MKMapItem(placemark: startPlacemark)
        let endItem = MKMapItem(placemark: endPlacemark)
        let mapItems = [startItem, endItem]
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        MKMapItem.openMaps(with: mapItems, launchOptions: launchOptions)
    }
}

struct LocationListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let location = Location(name: "Petshop & poultryshop by Klinik Hewan Waras Satwa", latitude: 1.107559, longitude: 104.091204)
        let locationManager = LocationManager()
        return LocationListItemView(location: location, locationManager: locationManager)
    }
}
