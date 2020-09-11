//
//  DeparturesView.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI

/**
 Departures list  view.
*/
struct DeparturesView: View {
    /// View model with all the search criteria datasources and the state for the criteria selected
    @ObservedObject var viewModel: DeparturesViewModel
    
    /// Init with viewmodel injection and plan view styles
    init(viewModel: DeparturesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
            List {
                if viewModel.loading {
                    loadingSection
                } else {
                    if viewModel.departuresDataSource.isEmpty {
                        emptySection
                    } else {
                        departures
                    }
                }
            }
            .navigationBarTitle("Departures", displayMode: .inline)

    }
}

private extension DeparturesView {
    // Departures section
    var departures: some View {
        Section {
            ForEach(viewModel.departuresDataSource, content: DepartureRow.init(viewModel:))
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
    
    var loadingSection: some View {
        Section {
            Text("Loading...")
                .foregroundColor(.gray)
        }
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
