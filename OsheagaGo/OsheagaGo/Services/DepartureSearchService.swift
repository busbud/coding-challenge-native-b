//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import OsheagaKit

final class DepartureSearchService {

    private var subscriptions = Set<AnyCancellable>()

    let client: DepartureSearching

    init(client: DepartureSearching = Environment(\.restClient).wrappedValue) {
        self.client = client
    }

    func fetch(param: DeparturePathParameter,
               query: DepartureQueryParameter,
               into result: Binding<DepartureSearchResult>,
               with loading: Binding<LoadingState<DepartureSearchResponse, OsheagaError>>,
               delay: TimeInterval = 0) {

        client
            .fetch(param: param, query: query)
            .delay(for: RunLoop.SchedulerTimeType.Stride(delay), scheduler: RunLoop.main)
            .updateLoadingState(loading)
            .sink(receiveValue: { response in
                result.wrappedValue = DepartureSearchResult(response, cities: result.wrappedValue.cities, locations: result.wrappedValue.locations)
            })
            .store(in: &subscriptions)
    }
}
