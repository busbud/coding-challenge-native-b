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
    var state: DestinationListViewState { get set }
    var repository: BusbudRepositoryAPIRequesting { get }
    
    func fetchNearbyDestinationsFrom(latitude: Double, longitude: Double) async
}


@Observable
final class DestinationListViewModel: DestinationListViewModelDefinition {
    var state: DestinationListViewState
    let repository: any BusbudRepositoryAPIRequesting
    let languageService: LanguageService
    
    init(state: DestinationListViewState = .idle, repository: BusbudRepositoryAPIRequesting = BusbudRepository(), languageService: LanguageService = LanguageService()) {
        self.state = state
        self.repository = repository
        self.languageService = languageService
    }
    
    @MainActor
    func fetchNearbyDestinationsFrom(latitude: Double, longitude: Double) async {
        state = .loading
        
        Task {
            do {            
                let destinations = try await repository.fetchNearByDestinations(latitude: latitude, longitude: longitude, limit: 10, language: languageService.currentLanguage.rawValue, sortByDistance: true)
                
                if destinations.count == 0 {
                    state = .empty
                } else {
                    state = .loaded(destinations)
                }
            } catch {
                Logger.log("Error fetching destinations: \(error)")
                state = .error
            }
        }

    }
}
