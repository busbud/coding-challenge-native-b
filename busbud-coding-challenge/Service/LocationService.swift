//
//  LocationService.swift
//  busbud-coding-challenge
//
//  Created by Spencer Diniz on 17/12/24.
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var locationContinuation: CheckedContinuation<CLLocationCoordinate2D, Error>?
    private var permissionContinuation: CheckedContinuation<Void, Error>?

    func requestLocation() async throws -> CLLocationCoordinate2D {
        try await requestPermission() // Ensure permission is granted

        return try await withCheckedThrowingContinuation { continuation in
            self.locationContinuation = continuation
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }

    private func requestPermission() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            self.permissionContinuation = continuation

            locationManager.delegate = self
            let status = locationManager.authorizationStatus

            switch status {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            default:
                break
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            permissionContinuation?.resume()
            permissionContinuation = nil
        case .restricted, .denied:
            permissionContinuation?.resume(throwing: LocationError.authorizationDenied)
            permissionContinuation = nil
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }

        let coordinate = location.coordinate

        locationContinuation?.resume(returning: coordinate)
        locationContinuation = nil
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationContinuation?.resume(throwing: error)
        locationContinuation = nil
        locationManager.stopUpdatingLocation()
    }

    enum LocationError: Error {
        case authorizationDenied
        case unknown
    }
}
