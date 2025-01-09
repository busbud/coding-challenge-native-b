//
//  DestinationListRowViewModelTests.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
import Testing
@testable import BusbudCodeChallenge

struct DestinationListRowViewModelTests {
    
    @Test
    func testInitializationWithDistance() {
        let destination = Destination(
            id: "1",
            name: "Paris",
            region: "Île-de-France",
            country: "France",
            latitude: 48.8566,
            longitude: 2.3522,
            geohash: "u09tun",
            distance: 10000  // 10 km
        )
        
        let viewModel = DestinationListRowViewModel(destination: destination)
        
        #expect(viewModel.title == "Paris")
        #expect(viewModel.subtitle == "6.21mi")
    }
    
    @Test
    func testInitializationWithoutDistance() {
        let destination = Destination(
            id: "2",
            name: "Berlin",
            region: "Berlin",
            country: "Germany",
            latitude: 52.5200,
            longitude: 13.4050,
            geohash: "u33dc1",
            distance: nil  // No distance provided
        )
        
        let viewModel = DestinationListRowViewModel(destination: destination)
        
        #expect(viewModel.title == "Berlin")
        #expect(viewModel.subtitle == "0mi")
    }
    
    @Test
    func testDistanceFormattingForVeryLargeDistance() {
        let destination = Destination(
            id: "3",
            name: "Sydney",
            region: "New South Wales",
            country: "Australia",
            latitude: -33.8688,
            longitude: 151.2093,
            geohash: "r3gx2x",
            distance: 1_609_344  // 1000 miles in meters
        )
        
        let viewModel = DestinationListRowViewModel(destination: destination)
        
        #expect(viewModel.subtitle.contains("1,000mi"))
    }
}
