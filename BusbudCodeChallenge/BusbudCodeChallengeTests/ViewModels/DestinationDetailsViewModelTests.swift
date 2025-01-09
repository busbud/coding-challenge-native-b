//
//  DestinationDetailsViewModelTests.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
import Testing
@testable import BusbudCodeChallenge

struct DestinationDetailsViewModelTests {
    
    @Test
    func testViewModelInitialization() {
        let destination = Destination(
            id: "1",
            name: "Rio de Janeiro",
            region: "Southeast",
            country: "Brazil",
            latitude: -22.9068,
            longitude: -43.1729,
            geohash: "6gkzwg",
            distance: 5000  // 5 km
        )
        
        let viewModel = DestinationDetailsViewModel(origin: "São Paulo", destination: destination)
        
        #expect(viewModel.origin == "São Paulo")
        #expect(viewModel.destination == "Rio de Janeiro")
        #expect(viewModel.region == "Southeast")
        #expect(viewModel.country == "Brazil")
        #expect(viewModel.latitude == -22.9068)
        #expect(viewModel.longitude == -43.1729)
        #expect(viewModel.geohash == "6gkzwg")
        #expect(viewModel.distance == "3.11mi")
    }
    
    @Test
    func testOpenURL() {
        var openedURL: URL?
        let destination = Destination(
            id: "1",
            name: "Rio de Janeiro",
            region: "Southeast",
            country: "Brazil",
            latitude: -22.9068,
            longitude: -43.1729,
            geohash: "6gkzwg"
        )
        
        let viewModel = DestinationDetailsViewModel(origin: "São Paulo", destination: destination, urlOpener: { url in
            openedURL = url  // Capture the URL that would be opened
        })
        
        viewModel.openURL()
        
        let expectedURL = URL(string: "https://www.busbud.com/en/c/6gkzwg")
        #expect(openedURL == expectedURL)
    }
    
    @Test
    func testDistanceFormattingWithNoDistance() {
        let destination = Destination(
            id: "2",
            name: "New York",
            region: "Northeast",
            country: "United States",
            latitude: 40.7128,
            longitude: -74.0060,
            geohash: "dr5reg",
            distance: nil  // No distance provided
        )
        
        let viewModel = DestinationDetailsViewModel(origin: "Boston", destination: destination)
        
        #expect(viewModel.distance == "0mi")
    }
}
