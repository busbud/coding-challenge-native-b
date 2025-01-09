//
//  GeoCoder.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

import CoreLocation

final class MockCLGeocoder: CLGeocoder {
    var mockPlacemarks: [CLPlacemark]?
    var mockError: Error?
    
    override func reverseGeocodeLocation(_ location: CLLocation, completionHandler: @escaping ([CLPlacemark]?, Error?) -> Void) {
        if let error = mockError {
            completionHandler(nil, error)
        } else {
            completionHandler(mockPlacemarks, nil)
        }
    }
}
