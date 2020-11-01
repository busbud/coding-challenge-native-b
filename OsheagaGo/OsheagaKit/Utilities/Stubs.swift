//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

extension DeparturePathParameter {

    public static func make(date outboundDate: Date, poll: Bool = false) -> DeparturePathParameter {
        DeparturePathParameter(origin: "f2m673", destination: "f25dvk", outboundDate: outboundDate, poll: poll)
    }
}

extension DepartureQueryParameter {

    public static func make(with index: Int? = nil) -> DepartureQueryParameter {
        DepartureQueryParameter(child: Passenger(key: .child, number: 0),
                                adult: Passenger(key: .adult, number: 1),
                                senior: Passenger(key: .senior, number: 0),
                                index: index)
    }
}

extension DepartureSearchResult {

    public static func make(_ count: Int = 5, complete: Bool = false) -> DepartureSearchResult {
        DepartureSearchResult((0..<count).map { _ in DepartureItem() }, complete: complete)
    }
}

extension DepartureItem {

    public init() {
        self.operatorProvider = .make()
        self.departure = LocationInfo(time: "9:00 am", name: "Gare du Palais", city: "Québec City")
        self.arrival = LocationInfo(time: "1:00 pm", name: "Gare d'autocars", city: "Montréal")
        self.price = "$44.90"
        self.duration = 3 * 60 * 60
    }

    public static func make() -> DepartureItem {
        DepartureItem()
    }
}

extension Operator {

    public init() {
        self.id = ""
        self.name = "Orléans Express"
        self.logoURL = nil
        self.displayName = "Orléans Express"
    }

    public static func make() -> Operator {
        Operator()
    }
}

extension DepartureSearchResponse {

    public static func make() -> DepartureSearchResponse {
        do {
            let json = JSON.departures.data(using: .utf8)!
            let response = try JSONDecoder().decode(DepartureSearchResponse.self, from: json)
            return response
        } catch {
            fatalError("Couldn't load the json")
        }
    }
}
