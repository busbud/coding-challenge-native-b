//  
//  ServiceModelsUnitTests.swift
//  busbud-coding-challengeTests
//
//  Created by Spencer Diniz on 17/12/24.
//

import XCTest
@testable import busbud_coding_challenge

final class ServiceModelsTests: XCTestCase {
    func testDecodingSuggestionsResponse() throws {
        let json = """
        {
            "suggestions": [
                {
                    "provider": "testProvider",
                    "id": "123",
                    "place_id": "place123",
                    "geo_entity_id": "geo123",
                    "parent_id": "parent123",
                    "label": "Test Label",
                    "score": 0.9,
                    "place_type": "city",
                    "stop_type": "bus_stop",
                    "url": "https://example.com",
                    "geohash": "u4pruydqqvj",
                    "lat": 40.7128,
                    "lon": -74.0060,
                    "hierarchy_info": {
                        "country": {
                            "code": "US",
                            "name": "United States"
                        },
                        "region": {
                            "code": "NY",
                            "name": "New York"
                        }
                    },
                    "city_name": "New York",
                    "region_name": "New York",
                    "country_name": "United States",
                    "full_name": "New York, United States",
                    "short_name": "NY",
                    "request_id": "req123"
                }
            ],
            "results_type": "test"
        }
        """

        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()

        let response = try decoder.decode(SuggestionsResponse.self, from: jsonData)

        XCTAssertEqual(response.resultsType, "test")
        XCTAssertEqual(response.suggestions.count, 1)

        let suggestion = response.suggestions.first!
        XCTAssertEqual(suggestion.provider, "testProvider")
        XCTAssertEqual(suggestion.id, "123")
        XCTAssertEqual(suggestion.label, "Test Label")
        XCTAssertEqual(suggestion.hierarchyInfo.country.name, "United States")
        XCTAssertEqual(suggestion.hierarchyInfo.region.name, "New York")
    }

    func testFormattedDistanceInKm() {
        var suggestion = Suggestion(
            provider: "testProvider",
            id: "123",
            placeID: "place123",
            geoEntityID: "geo123",
            parentID: nil,
            label: "Test Label",
            score: 0.9,
            placeType: "city",
            stopType: "bus_stop",
            url: "https://example.com",
            geohash: "u4pruydqqvj",
            lat: 40.7128,
            lon: -74.0060,
            hierarchyInfo: HierarchyInfo(
                country: Country(code: "US", name: "United States"),
                region: Region(code: "NY", name: "New York")
            ),
            cityName: "New York",
            regionName: "New York",
            countryName: "United States",
            fullName: "New York, United States",
            shortName: "NY",
            requestID: "req123",
            distance: nil
        )

        XCTAssertEqual(suggestion.formattedDistanceInKm, "")
        suggestion.distance = 1500
        XCTAssertEqual(suggestion.formattedDistanceInKm, "1.50 km")
    }

    func testFormattedDistanceInMiles() {
        var suggestion = Suggestion(
            provider: "testProvider",
            id: "123",
            placeID: "place123",
            geoEntityID: "geo123",
            parentID: nil,
            label: "Test Label",
            score: 0.9,
            placeType: "city",
            stopType: "bus_stop",
            url: "https://example.com",
            geohash: "u4pruydqqvj",
            lat: 40.7128,
            lon: -74.0060,
            hierarchyInfo: HierarchyInfo(
                country: Country(code: "US", name: "United States"),
                region: Region(code: "NY", name: "New York")
            ),
            cityName: "New York",
            regionName: "New York",
            countryName: "United States",
            fullName: "New York, United States",
            shortName: "NY",
            requestID: "req123",
            distance: nil
        )

        XCTAssertEqual(suggestion.formattedDistanceInMiles, "")
        suggestion.distance = 1609.34
        XCTAssertEqual(suggestion.formattedDistanceInMiles, "1.00 mi")
    }

    func testFormattedDistance() {
        let suggestion = Suggestion(
            provider: "testProvider",
            id: "123",
            placeID: "place123",
            geoEntityID: "geo123",
            parentID: nil,
            label: "Test Label",
            score: 0.9,
            placeType: "city",
            stopType: "bus_stop",
            url: "https://example.com",
            geohash: "u4pruydqqvj",
            lat: 40.7128,
            lon: -74.0060,
            hierarchyInfo: HierarchyInfo(
                country: Country(code: "US", name: "United States"),
                region: Region(code: "NY", name: "New York")
            ),
            cityName: "New York",
            regionName: "New York",
            countryName: "United States",
            fullName: "New York, United States",
            shortName: "NY",
            requestID: "req123",
            distance: 3000
        )

        XCTAssertEqual(suggestion.formattedDistance, "3.00 km / 1.86 mi")
    }
}
