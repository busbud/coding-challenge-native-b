//
//  DestinationListViewModelTests.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
import Testing
@testable import BusbudCodeChallenge

struct DestinationListViewModelTests {
        
    @Test
    func testFetchDestinationsSuccessState() async {
        let repository = MockBusbudRepository()
        let mockDestinations = [
            Destination(id: "1", name: "Rio de Janeiro", region: "Southeast", country: "Brazil", latitude: -22.9068, longitude: -43.1729, geohash: "6gkzwg", distance: 5000)
        ]
        repository.mockDestinations = mockDestinations
        
        let viewModel = DestinationListViewModel(repository: repository)
        
        await viewModel.fetchNearbyDestinationsFrom(latitude: -23.5505, longitude: -46.6333)
        
        if case .loaded(let destinations) = viewModel.state {
            #expect(destinations == mockDestinations)
        }  else {
            #expect(Bool(false), "Expected state to be .loaded")
        }
    }
    
    @Test
    func testFetchDestinationsEmptyState() async {
        let repository = MockBusbudRepository()
        repository.mockDestinations = []  // Empty destinations list
        
        let viewModel = DestinationListViewModel(repository: repository)
        
        await viewModel.fetchNearbyDestinationsFrom(latitude: -23.5505, longitude: -46.6333)
        
        #expect(viewModel.state == .empty)
    }
    
    @Test
    func testFetchDestinationsErrorState() async {
        let repository = MockBusbudRepository()
        repository.shouldThrowError = true  // Simulate error
        
        let viewModel = DestinationListViewModel(repository: repository)
        
        await viewModel.fetchNearbyDestinationsFrom(latitude: 37.7749, longitude: -122.4194)
        
        #expect(viewModel.state == .error)
    }
}
