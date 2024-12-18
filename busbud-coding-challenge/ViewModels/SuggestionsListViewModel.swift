//
//  SuggestionsListViewModel.swift
//  busbud-coding-challenge
//
//  Created by Spencer Diniz on 17/12/24.
//

import Foundation
import CoreLocation

@MainActor
class SuggestionsListViewModel: ObservableObject {
    @Published var suggestions: [Suggestion] = []
    private let service: BusbudServiceProtocol

    init(service: BusbudServiceProtocol = BusbudService.shared) {
        self.service = service
    }

    func loadData(for coordinate: CLLocationCoordinate2D) async {
        let fetchedSuggestions = try? await service.fetchSuggestions(for: coordinate)
        suggestions = fetchedSuggestions ?? []
    }
}
