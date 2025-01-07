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
    
    func fetchDestinations()
}


@Observable
final class DestinationListViewModel: DestinationListViewModelDefinition {
    
    let destinations: [Destination]
    var state: DestinationListViewState
    
    init(destinations: [Destination],  state: DestinationListViewState = .idle) {
        self.destinations = destinations
        self.state = state
    }
    
    func fetchDestinations() {
        // Start with loading state
        state = .loading
        
        Task {
            do {
                // Simulate a delay
                try await Task.sleep(nanoseconds: 1_000_000_000)
                
                // Generate a random outcome (1: Error, 2-4: Success, 5: Empty)
                let outcome = Int.random(in: 1...5)
                
                switch outcome {
                case 1:
                    // Simulate an error
                    state = .error
                    print("Simulating an error response")
                case 2...4:
                    // Simulate a successful response
                    if destinations.isEmpty {
                        state = .empty
                        print("Simulating an empty response")
                    } else {
                        state = .loaded
                        print("Simulating a successful response with data")
                    }
                case 5:
                    // Simulate an empty response
                    state = .empty
                    print("Simulating an empty response")
                default:
                    break
                }
            } catch {
                // Handle any errors
                state = .error
                print("Task failed: \(error)")
            }
        }
    }
}
