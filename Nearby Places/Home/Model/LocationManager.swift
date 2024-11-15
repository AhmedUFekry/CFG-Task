//
//  LocationManager.swift
//  Nearby Places
//
//  Created by A7med Fekry on 15/11/2024.
//

import Foundation
import CoreLocation

class LocationManagerr: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var locationCallback: ((CLLocation?, Error?) -> Void)?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    /// Request location permissions
    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    /// Get the current location
    /// - Parameter completion: A callback that returns the location or an error
    func getCurrentLocation(completion: @escaping (CLLocation?, Error?) -> Void) {
        locationCallback = completion
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        } else {
            completion(nil, NSError(domain: "LocationServicesDisabled", code: 1, userInfo: [NSLocalizedDescriptionKey: "Location services are disabled"]))
        }
    }

    // MARK: - CLLocationManagerDelegate Methods

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationCallback?(location, nil)
        }
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationCallback?(nil, error)
    }
}
