//
//  LocationManager.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

import CoreLocation

enum LocationAuthorizationState {
    case notDetermined
    case denied
    case authorized
    
    init (_ authorizationStatus: CLAuthorizationStatus) {
        switch authorizationStatus {
        case .notDetermined:
            self = .notDetermined
        case .denied, .restricted:
            self = .denied
        case .authorizedAlways, .authorizedWhenInUse:
            self = .authorized
        default:
            self = .notDetermined
        }
    }
}

class LocationManager: NSObject {
    private var locationManager: CLLocationManager = CLLocationManager()
    private var currentLocationContinuation: CheckedContinuation<CLLocation, Error>?
    private var locationPermissionContinuation: CheckedContinuation<LocationAuthorizationState, Error>?
    
    init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        self.locationManager.distanceFilter = 10000
    }
    
    @MainActor
    func requestPermission() async throws -> LocationAuthorizationState {
        if let continuation = locationPermissionContinuation {
            continuation.resume(throwing: CancellationError())
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            locationPermissionContinuation = continuation
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func requestCurrentPermissionState() -> LocationAuthorizationState {
        let state = LocationAuthorizationState(locationManager.authorizationStatus)
        
        return state
    }
    
    @MainActor
    func requestCurrentLocation() async throws -> CLLocation {
        if let continuation = currentLocationContinuation {
            continuation.resume(throwing: CancellationError())
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            currentLocationContinuation = continuation
            locationManager.requestLocation()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let authorizationState = LocationAuthorizationState(manager.authorizationStatus)
        locationPermissionContinuation?.resume(returning: authorizationState)
        locationPermissionContinuation = nil
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocationContinuation?.resume(returning: location)
            currentLocationContinuation = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        currentLocationContinuation?.resume(throwing: error)
        currentLocationContinuation = nil
    }
    
}
