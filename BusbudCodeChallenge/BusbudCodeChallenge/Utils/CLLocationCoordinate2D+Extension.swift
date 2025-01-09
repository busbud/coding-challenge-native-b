//
//  CLLocationCoordinate2D+Extension.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

import CoreLocation
import MapKit

extension CLLocationCoordinate2D {
    func getLocationName() async throws -> String? {
        let location = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let geocoder = CLGeocoder()
        
        let placemarks = try await geocoder.reverseGeocodeLocation(location)
        return placemarks.first?.locality
    }
    
    func getDrivableDistance(to destination: CLLocationCoordinate2D) async throws -> CLLocationDistance {
        let startPlacemark = MKPlacemark(coordinate: self)
        let destinationPlacemark = MKPlacemark(coordinate: destination)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startPlacemark)
        request.destination = MKMapItem(placemark: destinationPlacemark)
        request.transportType = .automobile  // It could be .transit but Apple Maps is not a reliable source of transit routes accross the board
        
        let directions = MKDirections(request: request)
        
        return try await withCheckedThrowingContinuation { continuation in
            directions.calculate { response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let route = response?.routes.first {
                    continuation.resume(returning: route.distance)
                } else {
                    continuation.resume(throwing: NSError(domain: "No route found", code: 0, userInfo: nil))
                }
            }
        }
    }
}
