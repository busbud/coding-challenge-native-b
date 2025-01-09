//
//  LocationManager.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
import CoreLocation

final class MockCLLocationManager: CLLocationManager {
    var mockAuthorizationStatus: CLAuthorizationStatus = .notDetermined
    var mockLocations: [CLLocation] = []
    var mockError: Error?
    
    override var authorizationStatus: CLAuthorizationStatus {
        return mockAuthorizationStatus
    }
    
    override func requestWhenInUseAuthorization() {
        delegate?.locationManagerDidChangeAuthorization?(self)
    }
    
    override func requestLocation() {
        if let error = mockError {
            delegate?.locationManager?(self, didFailWithError: error)
        } else {
            delegate?.locationManager?(self, didUpdateLocations: mockLocations)
        }
    }
}
