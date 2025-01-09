//
//  CLLocationCoordinate2DTests.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//

import CoreLocation
import MapKit
import Testing
@testable import BusbudCodeChallenge

struct CLLocationCoordinate2DExtensionTests {

    @Test
    func testGetLocationNameSuccess() async throws {
        let coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        let locationName = try await coordinate.getLocationName()
        
        #expect(locationName == "San Francisco")
    }
    
    @Test
    func testGetLocationNameFailure() async throws {
        let mockGeocoder = MockCLGeocoder()
        mockGeocoder.mockError = NSError(domain: "GeocoderError", code: 1, userInfo: nil)
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        
        var didThrowError = false
        do {
            _ = try await coordinate.getLocationName(geocoder: mockGeocoder)
        } catch {
            didThrowError = true
            #expect((error as NSError).domain == "GeocoderError")
        }
        
        #expect(didThrowError)
    }
}
