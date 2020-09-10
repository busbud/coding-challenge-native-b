//
//  HomeSearchBuilder.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI

public enum HomeSearchBuilder {
    /// Build DeparturesView and inject search criteria, fetcher and view model
    static func makeDeparturesView(
        withCriteria criteria: DeparturesCriteria
    ) -> some View {
        let fetcher = BBAPIFetcher()
        let viewModel = DeparturesViewModel(criteria: criteria, apiFetcher: fetcher)
        return DeparturesView(viewModel: viewModel)
    }
}
