//
//  BusBudRepositoryTests.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
import Testing
import CoreLocation
@testable import BusbudCodeChallenge


struct BusbudRepositoryTests {
    
    @Test
    func testFetchNearByDestinationsWithoutSorting() async throws {
        let mockAPIClient = MockAPIClient()
        let repository = BusbudRepository(apiClient: mockAPIClient)
        
        let destinations = [
            Destination(id: "1", name: "City A", region: "Region A", country: "Country A", latitude: 10.0, longitude: 20.0, geohash: "abc", distance: nil),
            Destination(id: "2", name: "City B", region: "Region B", country: "Country B", latitude: 30.0, longitude: 40.0, geohash: "def", distance: nil)
        ]
        let mockDestinations = Destinations(destinations: destinations)
        
        mockAPIClient.registerMockResponse(for: "flex/suggestions/points-of-interest", response: mockDestinations)
        
        let result = try await repository.fetchNearByDestinations(latitude: 37.7749, longitude: -122.4194, sortByDistance: false)
        
        #expect(result == destinations)  // The list should be returned unsorted
    }
    
    @Test
    func testFetchNearByDestinationsWithSorting() async throws {
        let mockAPIClient = MockAPIClient()
        
        // Mock drivable distances
        let mockDrivableDistanceProvider: (CLLocationCoordinate2D, CLLocationCoordinate2D) async throws -> CLLocationDistance = { start, end in
            if end.latitude == 10.0 && end.longitude == 20.0 {
                return 5000  // Distance for City A
            } else if end.latitude == 30.0 && end.longitude == 40.0 {
                return 15000  // Distance for City B
            }
            return 0
        }
        
        let repository = BusbudRepository(apiClient: mockAPIClient, drivableDistanceProvider: mockDrivableDistanceProvider)
        
        let destinations = [
            Destination(id: "1", name: "City A", region: "Region A", country: "Country A", latitude: 10.0, longitude: 20.0, geohash: "abc", distance: nil),
            Destination(id: "2", name: "City B", region: "Region B", country: "Country B", latitude: 30.0, longitude: 40.0, geohash: "def", distance: nil)
        ]
        let mockDestinations = Destinations(destinations: destinations)
        
        mockAPIClient.registerMockResponse(for: "flex/suggestions/points-of-interest", response: mockDestinations)
        
        let result = try await repository.fetchNearByDestinations(latitude: 37.7749, longitude: -122.4194, sortByDistance: true)
        
        #expect(result[0].id == "1")  // "City A" should be closer (5000m)
        #expect(result[1].id == "2")  // "City B" is farther (15000m)
    }
    
    @Test
    func testFetchNearByDestinationsAPIError() async throws {
        let mockAPIClient = MockAPIClient()
        let repository = BusbudRepository(apiClient: mockAPIClient)
        
        mockAPIClient.registerMockError(for: "flex/suggestions/points-of-interest", error: APIClientError.networkError(URLError(.notConnectedToInternet)))
        
        var didThrowError = false
        do {
            let _ = try await repository.fetchNearByDestinations(latitude: 37.7749, longitude: -122.4194)
        } catch {
            didThrowError = true
            #expect(error is APIClientError)
        }
        
        #expect(didThrowError)
    }
}
