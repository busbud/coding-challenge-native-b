//
//  LocationManagerTests.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//

import CoreLocation
import Foundation
import Testing
@testable import BusbudCodeChallenge

struct LocationManagerTests {
    
    @Test
    func testRequestPermissionAuthorized() async throws {
        let mockLocationManager = MockCLLocationManager()
        mockLocationManager.mockAuthorizationStatus = .authorizedWhenInUse
        
        let locationManager = LocationManager(locationManager: mockLocationManager)
        
        Task {
            mockLocationManager.delegate?.locationManagerDidChangeAuthorization?(mockLocationManager)
        }
        
        let result = try await locationManager.requestPermission()
        #expect(result == .authorized)
    }
    
    @Test
    func testRequestPermissionDenied() async throws {
        let mockLocationManager = MockCLLocationManager()
        mockLocationManager.mockAuthorizationStatus = .denied
        
        let locationManager = LocationManager(locationManager: mockLocationManager)
        
        Task {
            mockLocationManager.delegate?.locationManagerDidChangeAuthorization?(mockLocationManager)
        }
        
        let result = try await locationManager.requestPermission()
        #expect(result == .denied)
    }
    
    @Test
    func testRequestCurrentPermissionStateNotDetermined() {
        let mockLocationManager = MockCLLocationManager()
        mockLocationManager.mockAuthorizationStatus = .notDetermined
        
        let locationManager = LocationManager(locationManager: mockLocationManager)
        
        let state = locationManager.requestCurrentPermissionState()
        #expect(state == .notDetermined)
    }
    
    @Test
    func testRequestCurrentLocationSuccess() async throws {
        let mockLocationManager = MockCLLocationManager()
        let expectedLocation = CLLocation(latitude: 37.7749, longitude: -122.4194)
        mockLocationManager.mockLocations = [expectedLocation]
        
        let locationManager = LocationManager(locationManager: mockLocationManager)
        
        Task {
            mockLocationManager.delegate?.locationManager?(mockLocationManager, didUpdateLocations: [expectedLocation])
        }
        
        let result = try await locationManager.requestCurrentLocation()
        #expect(result.coordinate.latitude == expectedLocation.coordinate.latitude)
        #expect(result.coordinate.longitude == expectedLocation.coordinate.longitude)
    }
    
    @Test
    func testRequestCurrentLocationFailure() async throws {
        let mockLocationManager = MockCLLocationManager()
        let expectedError = NSError(domain: "LocationError", code: 1, userInfo: nil)
        mockLocationManager.mockError = expectedError
        
        let locationManager = LocationManager(locationManager: mockLocationManager)
        
        var didThrowError = false
        do {
            _ = try await locationManager.requestCurrentLocation()
        } catch {
            didThrowError = true
            #expect((error as NSError).domain == expectedError.domain)
        }
        
        #expect(didThrowError)
    }
}
