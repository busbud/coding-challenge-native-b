//
//  SuggestionsListViewModelTests.swift
//  busbud-coding-challengeTests
//
//  Created by Spencer Diniz on 18/12/24.
//

import XCTest
import CoreLocation
@testable import busbud_coding_challenge

@MainActor
final class SuggestionsListViewModelTests: XCTestCase {
    func testLoadData_withMockedService_returnsSuggestions() async throws {
        let mockService = MockBusbudService()
        let viewModel = SuggestionsListViewModel(service: mockService)
        let mockCoordinate = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)

        await viewModel.loadData(for: mockCoordinate)

        XCTAssertEqual(viewModel.suggestions.count, 2)
        XCTAssertEqual(viewModel.suggestions.first?.cityName, "New York")
        XCTAssertEqual(viewModel.suggestions.last?.cityName, "San Francisco")
    }

    func testLoadData_withMockedService_returnsEmptyWhenNoData() async throws {
        let mockService = MockBusbudService(empty: true)
        let viewModel = SuggestionsListViewModel(service: mockService)
        let mockCoordinate = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)

        await viewModel.loadData(for: mockCoordinate)
        XCTAssertTrue(viewModel.suggestions.isEmpty)
    }
}

struct MockBusbudService: BusbudServiceProtocol {
    let empty: Bool

    init(empty: Bool = false) {
        self.empty = empty
    }

    func fetchSuggestions(for coordinate: CLLocationCoordinate2D) async throws -> [Suggestion] {
        if empty {
            return []
        } else {
            return [
                Suggestion(
                    provider: "mockProvider",
                    id: "1",
                    placeID: "place1",
                    geoEntityID: "geo1",
                    parentID: nil,
                    label: "Label 1",
                    score: 0.9,
                    placeType: "city",
                    stopType: "stop",
                    url: "https://example.com/1",
                    geohash: "abc123",
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
                    requestID: "req1",
                    distance: nil
                ),
                Suggestion(
                    provider: "mockProvider",
                    id: "2",
                    placeID: "place2",
                    geoEntityID: "geo2",
                    parentID: nil,
                    label: "Label 2",
                    score: 0.8,
                    placeType: "city",
                    stopType: "stop",
                    url: "https://example.com/2",
                    geohash: "xyz789",
                    lat: 37.7749,
                    lon: -122.4194,
                    hierarchyInfo: HierarchyInfo(
                        country: Country(code: "US", name: "United States"),
                        region: Region(code: "CA", name: "California")
                    ),
                    cityName: "San Francisco",
                    regionName: "California",
                    countryName: "United States",
                    fullName: "San Francisco, United States",
                    shortName: "SF",
                    requestID: "req2",
                    distance: nil
                )
            ]
        }
    }
}
