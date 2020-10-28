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

    func fetch(param: DeparturePathParameter = .make(),
               query: DepartureQueryParameter = .make(),
               into loading: Binding<LoadingState<DepartureSearchResult, OsheagaError>>) {

        client
            .fetch(param: param, query: query)
            .updateLoadingState(loading)
            .sink(receiveValue: { _ in })
            .store(in: &subscriptions)
    }
}

extension DeparturePathParameter {

    static func make(calendar: Calendar = .current) -> DeparturePathParameter {
        let date = DateComponents(calendar: calendar, timeZone: calendar.timeZone, year: 2020, month: 10, day: 29).date ?? Date()
        return DeparturePathParameter(origin: "f2m673", destination: "f25dvk", outboundDate: date)
    }
}

extension DepartureQueryParameter {

    static func make() -> DepartureQueryParameter {
        return DepartureQueryParameter()
    }
}
