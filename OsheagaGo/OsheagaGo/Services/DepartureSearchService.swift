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
               into loading: Binding<LoadingState<DepartureSearchResult, OsheagaError>>,
               delay: TimeInterval = 0) {

        client
            .fetch(param: param, query: query)
            .delay(for: RunLoop.SchedulerTimeType.Stride(delay), scheduler: RunLoop.main)
            .updateLoadingState(loading)
            .sink(receiveValue: { _ in })
            .store(in: &subscriptions)
    }
}

// Stubs - Default values

extension DeparturePathParameter {

    static func make(calendar: Calendar = .current) -> DeparturePathParameter {
        let date = DateComponents(calendar: calendar,
                                  timeZone: calendar.timeZone,
                                  year: 2020, month: 11, day: 25).date ?? Date()
        return DeparturePathParameter(origin: "f2m673", destination: "f25dvk", outboundDate: date)
    }

    static func makePoll(calendar: Calendar = .current) -> DeparturePathParameter {
        let date = DateComponents(calendar: calendar,
                                  timeZone: calendar.timeZone,
                                  year: 2020, month: 11, day: 25).date ?? Date()
        return DeparturePathParameter(origin: "f2m673", destination: "f25dvk", outboundDate: date, poll: true)
    }
}

extension DepartureQueryParameter {

    static func make() -> DepartureQueryParameter {
        DepartureQueryParameter(adult: Passenger(key: .adult, number: 1),
                                child: Passenger(key: .child, number: 0),
                                senior: Passenger(key: .senior, number: 0))
    }

    static func makePoll(_ index: Int) -> DepartureQueryParameter {
        DepartureQueryParameter(adult: Passenger(key: .adult, number: 1),
                                child: Passenger(key: .child, number: 0),
                                senior: Passenger(key: .senior, number: 0),
                                index: index)
    }
}
