//
//  Location.swift
//  hobbyprosjekt
//
//  Created by Bruker on 07/10/2024.
//

import Foundation
import CoreLocation
import Combine

class Location: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var location = CLLocationManager()
    @Published var currentLocation: CLLocation? // Holder styr på nåværende posisjon

    override init() {
        super.init()
        self.location.delegate = self
        self.location.requestWhenInUseAuthorization() // Be om tillatelse
    }

    func startUpdatingLocation() {
        self.location.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        self.location.stopUpdatingLocation()
    }

    func location(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.currentLocation = location // Oppdaterer den nåværende posisjonen
        }
    }
}


