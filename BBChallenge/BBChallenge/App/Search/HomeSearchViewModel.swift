//
//  HomeSearchViewModel.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI
import Combine

/**
 Search departures view model.
 Defines all the datasources for the search criterias,
 holds the state of the search criterias and inject the departures view.
*/
class HomeSearchViewModel: ObservableObject {
    
    /// List of origins
    @Published var originsDatasource: [DepartureModel] = []
    /// List of destinations
    @Published var destinationsDatasource: [DepartureModel] = []
    /// List of languages
    @Published var languagesDatasource: [LanguageISOModel] = []
    /// List of currencies
    @Published var currenciesDatasource: [CurrencyISOModel] = []
    
    /// Store the selected origin
    @Published var initialDestinationSelected: Int = 0
    /// Store the selected destination
    @Published var finalDestinationSelected: Int = 1
    /// Store the selected departure date
    @Published var departureDate =
        Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    /// Store the selected number of adults
    @Published var adult: Double = 1
    /// Store the selected number of children
    @Published var child: Double = 0
    /// Store the selected number of senios
    @Published var senior: Double = 0
    /// Store the selected language
    @Published var languageSelected = 44
    /// Store the selected currency
    @Published var currencySelected = 149
    
    /// Load the datasources
    init() {
        fetchOrigins()
        fetchDestinations()
        fetchLanguages()
        fetchCurrencies()
    }

    /// Load origins
    func fetchOrigins() {
        originsDatasource = DepartureModel.departures
    }

    /// Load destinations
    func fetchDestinations() {
        destinationsDatasource = DepartureModel.departures
    }

    /// Load languages
    func fetchLanguages() {
        languagesDatasource =
            LanguageISOModel.languages.filter { !$0.alpha2.isEmpty}
    }

    /// Load currencies
    func fetchCurrencies() {
        currenciesDatasource = CurrencyISOModel.currencies
    }
}

extension HomeSearchViewModel {
    /// Injects the departure criteria, the view model and the fetcher to the departures view
    var departuresView: some View {
        let departureDate = shortDateFormatter.string(from: self.departureDate)
        let departureCriteria = DeparturesCriteria(
            initialDestination: originsDatasource[initialDestinationSelected].geohash,
            finalDestination: destinationsDatasource[finalDestinationSelected].geohash,
            departureDate: departureDate,
            adults: Int(adult),
            children: Int(child),
            seniors: Int(senior),
            language: languagesDatasource[languageSelected].alpha2,
            currency: currenciesDatasource[currencySelected].code)

        return HomeSearchBuilder.makeDeparturesView(withCriteria: departureCriteria)
    }
}
