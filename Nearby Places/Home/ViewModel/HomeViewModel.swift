//
//  HomeViewModel.swift
//  Nearby Places
//
//  Created by A7med Fekry on 15/11/2024.
//

import Foundation
import CoreLocation

class HomeViewModel {
    private let locationManager = LocationManagerr()
    var latitude : CLLocationDegrees = 23.0340847
    var longitude : CLLocationDegrees = 72.5084728
    
    // Bindable closure to update the view
    var bindResultToHomeView: (() -> ()) = {}
    
    // Result from the API
    var result: ApiResponse? {
        didSet {
            bindResultToHomeView()
        }
    }
    
    // Initialize and request location
    init() {
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        // Request location authorization
        locationManager.requestLocationAuthorization()
        
        // Get the current location
        locationManager.getCurrentLocation { [weak self] location, error in
            if let error = error {
                print("Failed to get location: \(error.localizedDescription)")
                return
            }
            
            if let location = location {
                self?.latitude = location.coordinate.latitude
                self?.longitude = location.coordinate.longitude
                print("Latitude: \(String(describing: self?.latitude)), Longitude: \(String(describing: self?.longitude))")
                
                // Fetch items using the current location
                self?.getItems(latitude: self!.latitude, longitude: self!.longitude)
            }
        }
    }
    
    // Fetch items from the API
    func getItems(latitude: Double, longitude: Double) {
        // Construct the URL with the dynamic location
        let url = "https://api.foursquare.com/v2/venues/search?ll=\(latitude),\(longitude)&client_id=4EQRZPSGKBZGFSERGJY055FRW2OSPJRZYR4C3J0JN2CQQFIV&client_secret=AJR4B5LLRONWAJWJJOACHAFLCWS2YJAZMGQNFFZQP0IB3THR&v=20180910"
        
        // Call the network service
        NetworkService.fetchResult(urll: url) { [weak self] (result: ApiResponse?) in
            guard let result = result else {
                print("Failed to fetch data from API")
                return
            }
            
            print("Request ID: \(result.meta?.requestId ?? "Not found")")
            self?.result = result
        }
    }
}

