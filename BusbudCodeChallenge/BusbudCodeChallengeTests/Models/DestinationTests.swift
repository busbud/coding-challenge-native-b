//
//  DestinationTests.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
import Testing
@testable import BusbudCodeChallenge

struct DestinationTests {

    // Test decoding a single Destination
    @Test
    func testDecodeSingleDestination() async throws {
        let json = """
        {
          "place_id": "29bbad65-0643-49a5-8510-7f1da04adf03",
          "city_name": "Santa Maria",
          "region_name": "Rio Grande do Sul",
          "country_name": "Brazil",
          "lat": -29.6873064,
          "lon": -53.8154769,
          "geohash": "6f9xp7"
        }
        """
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        let destination = try decoder.decode(Destination.self, from: data)
        
        #expect(destination.id == "29bbad65-0643-49a5-8510-7f1da04adf03")
        #expect(destination.name == "Santa Maria")
        #expect(destination.region == "Rio Grande do Sul")
        #expect(destination.country == "Brazil")
        #expect(destination.latitude == -29.6873064)
        #expect(destination.longitude == -53.8154769)
        #expect(destination.geohash == "6f9xp7")
        #expect(destination.distance == nil)  // Should be nil by default
    }
    
    @Test
    func testDecodeDestinationsArray() async throws {
        let json = """
        {
          "suggestions": [
            {
              "place_id": "29bbad65-0643-49a5-8510-7f1da04adf03",
              "city_name": "Santa Maria",
              "region_name": "Rio Grande do Sul",
              "country_name": "Brazil",
              "lat": -29.6873064,
              "lon": -53.8154769,
              "geohash": "6f9xp7"
            },
            {
              "place_id": "2bfa7c6a-5b85-442f-8a18-09f81fb8f2cb",
              "city_name": "Florianópolis",
              "region_name": "Santa Catarina",
              "country_name": "Brazil",
              "lat": -27.5954,
              "lon": -48.5480,
              "geohash": "6dy7fg"
            }
          ]
        }
        """
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        let destinations = try decoder.decode(Destinations.self, from: data)
        
        #expect(destinations.destinations.count == 2)
        #expect(destinations.destinations.first?.name == "Santa Maria")
        #expect(destinations.destinations.last?.name == "Florianópolis")
    }
    
    @Test
    func testInvalidJSONDecode() async throws {
        let invalidJSON = """
        {
            "place_id": "missing_fields"
        }
        """
        let data = invalidJSON.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        var didThrowError = false
        
        do {
            _ = try decoder.decode(Destination.self, from: data)
        } catch {
            didThrowError = true
        }
        
        #expect(didThrowError == true)
    }
}
