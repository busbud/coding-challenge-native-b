//
//  SuggestionDetailViewModelTests.swift
//  busbud-coding-challengeTests
//
//  Created by Spencer Diniz on 18/12/24.
//

import XCTest
import CoreLocation
@testable import busbud_coding_challenge

final class SuggestionDetailViewModelTests: XCTestCase {
    func testCityProperty() {
        let suggestion = createMockSuggestion()
        let viewModel = SuggestionDetailViewModel(suggestion: suggestion)

        XCTAssertEqual(viewModel.city, "New York")
    }

    func testRegionProperty() {
        let suggestion = createMockSuggestion()
        let viewModel = SuggestionDetailViewModel(suggestion: suggestion)

        XCTAssertEqual(viewModel.region, "New York")
    }

    func testCountryProperty() {
        let suggestion = createMockSuggestion()
        let viewModel = SuggestionDetailViewModel(suggestion: suggestion)

        XCTAssertEqual(viewModel.country, "United States")
    }

    func testDistanceProperty() {
        var suggestion = createMockSuggestion()
        suggestion.distance = 1500 // Distance in meters
        let viewModel = SuggestionDetailViewModel(suggestion: suggestion)

        XCTAssertEqual(viewModel.distance, "1.50 km / 0.93 mi")
    }

    func testGeohashProperty() {
        let suggestion = createMockSuggestion()
        let viewModel = SuggestionDetailViewModel(suggestion: suggestion)

        XCTAssertEqual(viewModel.geohash, "u4pruydqqvj")
    }

    func testCoordinateProperty() {
        let suggestion = createMockSuggestion()
        let viewModel = SuggestionDetailViewModel(suggestion: suggestion)
        let coordinate = viewModel.coordinate

        XCTAssertEqual(coordinate.latitude, 40.7128)
        XCTAssertEqual(coordinate.longitude, -74.0060)
    }

    // Helper function to create a mock Suggestion object
    private func createMockSuggestion() -> Suggestion {
        return Suggestion(
            provider: "testProvider",
            id: "123",
            placeID: "place123",
            geoEntityID: "geo123",
            parentID: "parent123",
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
    }
}
