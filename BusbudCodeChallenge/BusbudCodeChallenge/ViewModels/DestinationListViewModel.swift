//
//  DestinationListViewModel.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import Foundation

enum DestinationListViewState {
    case idle
    case loading
    case loaded
    case empty
    case error
}

protocol DestinationListViewModelDefinition {
    var destinations: [Destination] { get }
    var state: DestinationListViewState { get }
    var repository: BusbudRepositoryAPIRequesting { get }
    
    func fetchDestinations() async
}


@Observable
final class DestinationListViewModel: DestinationListViewModelDefinition {
    
    var destinations: [Destination]
    var state: DestinationListViewState
    let repository: any BusbudRepositoryAPIRequesting
    
    init(destinations: [Destination],  state: DestinationListViewState = .idle, repository: BusbudRepositoryAPIRequesting = BusbudRepository()) {
        self.destinations = destinations
        self.state = state
        self.repository = repository
    }
    
    @MainActor
    func fetchDestinations() {
        // Start with loading state
        state = .loading
        
        Task {
            do {
                let destinations = try await repository.fetchNearByDestinations(latitude: 40.7128, longitude: -74.0060, 10, "en")
                if destinations.count == 0 {
                    state = .empty
                } else {
                    state = .loaded
                    self.destinations = destinations
                }
                for destination in destinations {
                    print("Name: \(destination.name), Region: \(destination.region), Geohash: \(destination.geohash)")
                }
            } catch {
                print("Error fetching destinations: \(error)")
                state = .error
            }
        }

    }
}
