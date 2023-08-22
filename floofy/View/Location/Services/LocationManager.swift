//
//  LocationManager.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 21/08/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var currentLocation: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currentLocation = location
    }

    func distanceFromDevice(to location: Location) -> CLLocationDistance? {
        guard let currentLocation = currentLocation else { return nil }
        let locationCoordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let locationObj = CLLocation(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
        return currentLocation.distance(from: locationObj)
    }
}
