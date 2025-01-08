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
    case loaded([Destination])
    case empty
    case error
}

protocol DestinationListViewModelDefinition {
    var state: DestinationListViewState { get }
    var repository: BusbudRepositoryAPIRequesting { get }
    
    func fetchNearbyDestinationsFrom(latitude: Double, longitude: Double) async
}


@Observable
final class DestinationListViewModel: DestinationListViewModelDefinition {
    var state: DestinationListViewState
    let repository: any BusbudRepositoryAPIRequesting
    
    init(state: DestinationListViewState = .idle, repository: BusbudRepositoryAPIRequesting = BusbudRepository()) {
        self.state = state
        self.repository = repository
    }
    
    @MainActor
    func fetchNearbyDestinationsFrom(latitude: Double, longitude: Double) async {
        state = .loading
        
        Task {
            do {            
                let destinations = try await repository.fetchNearByDestinations(latitude: latitude, longitude: longitude, 10, "en")
                
                if destinations.count == 0 {
                    state = .empty
                } else {
                    state = .loaded(destinations)
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
