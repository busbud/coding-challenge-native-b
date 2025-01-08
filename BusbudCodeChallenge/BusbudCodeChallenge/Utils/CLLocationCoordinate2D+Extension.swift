//
//  CLLocationCoordinate2D+Extension.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

import CoreLocation

extension CLLocationCoordinate2D {
    func getLocationName() async throws -> String? {
        let location = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let geocoder = CLGeocoder()
        
        let placemarks = try await geocoder.reverseGeocodeLocation(location)
        return placemarks.first?.locality
    }
}
