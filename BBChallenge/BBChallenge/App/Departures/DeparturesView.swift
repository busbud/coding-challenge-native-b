//
//  DeparturesView.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI

struct DeparturesView: View {
    /// View model with all the search criteria datasources and the state for the criteria selected
    @ObservedObject var viewModel: DeparturesViewModel
    
    /// Init with viewmodel injection and plan view styles
    init(viewModel: DeparturesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// Simple preview with default data
struct DeparturesView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleDate = shortDateFormatter.string(from: Date())
        let criteria = DeparturesCriteria(
            initialDestination: "dr5reg",
            finalDestination: "f25dvk",
            departureDate: sampleDate,
            adults: 1,
            children: 0,
            seniors: 0,
            language: "EN",
            currency: "USD")
        let fetcher = BBAPIFetcher()
        let viewModel = DeparturesViewModel(criteria: criteria, apiFetcher: fetcher)
        return DeparturesView(viewModel: viewModel)
    }
}
