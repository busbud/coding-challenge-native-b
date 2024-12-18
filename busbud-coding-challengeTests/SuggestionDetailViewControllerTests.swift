//
//  SuggestionDetailViewControllerTests.swift
//  busbud-coding-challengeTests
//
//  Created by Spencer Diniz on 18/12/24.
//

import XCTest
import MapKit
@testable import busbud_coding_challenge

final class SuggestionDetailViewControllerTests: XCTestCase {
    private func createMockViewModel() -> SuggestionDetailViewModel {
        let mockSuggestion = Suggestion(
            provider: "mockProvider",
            id: "1",
            placeID: "place1",
            geoEntityID: "geo1",
            parentID: nil,
            label: "Test Label",
            score: 0.9,
            placeType: "city",
            stopType: "stop",
            url: "https://example.com",
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
            distance: 1500
        )
        return SuggestionDetailViewModel(suggestion: mockSuggestion)
    }

    func testViewControllerLoadsInfoCorrectly() {
        let viewModel = createMockViewModel()
        let sut = SuggestionDetailViewController(viewModel: viewModel) // System Under Test (SUT)

        sut.loadViewIfNeeded()

        XCTAssertEqual(sut.labelCityValue.text, "New York")
        XCTAssertEqual(sut.labelRegionValue.text, "New York")
        XCTAssertEqual(sut.labelCountryValue.text, "United States")
        XCTAssertEqual(sut.labelDistanceValue.text, "1.50 km / 0.93 mi")
    }

    func testMapViewDisplaysCorrectRegionAndAnnotation() {
        let viewModel = createMockViewModel()
        let sut = SuggestionDetailViewController(viewModel: viewModel)

        sut.loadViewIfNeeded()
        sut.view.layoutIfNeeded()

        let mapViewRegion = sut.mapView.region
        let expectedRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
            latitudinalMeters: 10000,
            longitudinalMeters: 10000
        )

        XCTAssertEqual(mapViewRegion.center.latitude, expectedRegion.center.latitude, accuracy: 0.01)
        XCTAssertEqual(mapViewRegion.center.longitude, expectedRegion.center.longitude, accuracy: 0.01)
        XCTAssertEqual(sut.mapView.annotations.count, 1)

        let annotation = sut.mapView.annotations.first as? MKPointAnnotation
        XCTAssertEqual(annotation!.coordinate.latitude, 40.7128, accuracy: 0.01)
        XCTAssertEqual(annotation!.coordinate.longitude, -74.0060, accuracy: 0.01)
        XCTAssertEqual(annotation?.title, "New York")
    }
}
