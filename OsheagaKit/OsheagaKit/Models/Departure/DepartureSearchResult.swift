//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct DepartureItem: Identifiable {

    public struct LocationInfo {
        public let time: String
        public let name: String
        public let city: String
    }

    public let id = UUID()

    public let operatorProvider: Operator?
    public let departure: LocationInfo
    public let arrival: LocationInfo
    public let price: String

    init?(departure: Departure, response: DepartureSearchResponse) {

        guard let origin = response.location(for: departure.originLocationId),
              let destination = response.location(for: departure.destinationLocationId),
              let operatorProvider = response.operatorProvider(for: departure.operatorId),
              let originCity = response.city(for: origin.cityId),
              let destinationCity = response.city(for: destination.cityId)
        else { return nil }

        self.operatorProvider = operatorProvider

        let departureTime = DateFormatter
            .shortTimeFormatter(with: departure.departureTimezone)
            .string(from: departure.departureTime)

        let arrivalTime = DateFormatter
            .shortTimeFormatter(with: departure.arrivalTimezone)
            .string(from: departure.arrivalTime)

        self.departure = LocationInfo(time: departureTime, name: origin.name, city: originCity.name)
        self.arrival = LocationInfo(time: arrivalTime, name: destination.name, city: destinationCity.name)

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = departure.prices.currencyCode
        self.price = formatter.string(from: NSNumber(value: departure.prices.total / 100.0)) ?? "n/a"
    }
}

public struct DepartureSearchResult {

    public let items: [DepartureItem]

    init(_ response: DepartureSearchResponse) {
        self.items = response.departures.compactMap { DepartureItem(departure: $0, response: response) }
    }
}

// Stubs

extension DepartureSearchResult {

    init() {
        self.items = []
    }

    public static func make() -> DepartureSearchResult {
        do {
            return try DepartureSearchResult(JSONDecoder().decode(DepartureSearchResponse.self, from: Data(JSON.departures.utf8)))
        } catch {
            return DepartureSearchResult()
        }
    }
}

extension DepartureItem {

    public init() {
        self.operatorProvider = .make()
        self.departure = LocationInfo(time: "9:00 am", name: "Gare du Palais", city: "Québec")
        self.arrival = LocationInfo(time: "1:00 pm", name: "Gare du Palais", city: "Montréal")
        self.price = "$44.90"
    }

    public static func make() -> DepartureItem {
        DepartureItem()
    }
}
