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
    public let duration: TimeInterval
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
        self.duration = departure.arrivalTime.timeIntervalSince(departure.departureTime)

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = departure.prices.currencyCode
        self.price = formatter.string(from: NSNumber(value: departure.prices.total / 100.0)) ?? "n/a"
    }
}

extension TimeInterval{

    public var stringFromTimeInterval: String {

        let time = NSInteger(self)
        let minutes = (time / 60) % 60
        let hours = (time / 3600)

        return String(format: "%0.2dh%0.2d",hours,minutes)
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

    init(_ items: [DepartureItem]) {
        self.items = items
    }

    public static func make(_ count: Int = 5) -> DepartureSearchResult {
        DepartureSearchResult((0..<count).map { _ in DepartureItem() })
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
