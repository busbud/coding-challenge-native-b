//
//  DeparturesViewModel.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI
import Combine

/**
 Departures list view model.
 Defines all the datasources for the departures,
 Holds the state of the departures and inject the departure detail view.
*/
class DeparturesViewModel: ObservableObject {
    
    /// Store the flag for loading
    @Published var loading = false
    /// Store the flag for sucription completed
    @Published var completed = true
    
    /// List of departures
    @Published var departuresDataSource: BusbudDeparturesJSON?
    /// Selected of departure
    let departureCriteria: DeparturesCriteria

    /// Remote Busbud API Fetcher
    private let bbAPIFetcher: BBAPIFetchable?
    /// Set of suscriptions for cleaning
    private var disposables = Set<AnyCancellable>()

    /// Inject departureCriteria, Busbud API Fetcher and a custom queue to search departures
    init(criteria departureCriteria: DeparturesCriteria, apiFetcher bbAPIFetcher: BBAPIFetchable?,
         scheduler: DispatchQueue = DispatchQueue(label: "DeparturesViewModel", qos: .userInitiated)
    ) {
        loading = true
        completed = false
        self.bbAPIFetcher = bbAPIFetcher
        self.departureCriteria = departureCriteria
        scheduler.async { self.fetchDepartures() }
    }
    
    /// Search departures
    func fetchDepartures() {
        self.bbAPIFetcher?.departures()
            .receive(on: DispatchQueue.main)
            .sink(
            // on complete clean flags
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.departuresDataSource = nil
                case .finished:
                    break
                }
                self.loading = false
                self.completed = true
            },
            // on value received update departures data source
            receiveValue: { [weak self] forecast in
                guard let self = self else { return }
                self.departuresDataSource = forecast
                self.loading = true
            }).store(in: &disposables)
    }
    
}
