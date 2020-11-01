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

    init?(departure: Departure, cities: [City]?, locations: [Location]?, operators: [Operator]) {

        guard let origin = locations?.first(where: { $0.id == departure.originLocationId }),
              let destination = locations?.first(where: { $0.id == departure.destinationLocationId }),
              let operatorProvider = operators.first(where: { $0.id == departure.operatorId }),
              let originCity = cities?.first(where: { $0.id == origin.cityId }),
              let destinationCity = cities?.first(where: { $0.id == destination.cityId })
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

    public let cities: [City]
    public let locations: [Location]

    public let items: [DepartureItem]
    public let complete: Bool

    public init(_ response: DepartureSearchResponse, cities: [City], locations: [Location]) {
        let aggrCities = cities + (response.cities ?? [])
        let aggrLocations = locations + (response.locations ?? [])
        self.items = response.departures.compactMap {
            DepartureItem(departure: $0,
                          cities: aggrCities,
                          locations: aggrLocations,
                          operators: response.operators)
        }
        self.cities = aggrCities
        self.locations = aggrLocations
        self.complete = response.complete
    }
}

extension DepartureSearchResult {

    public init() {
        self.items = []
        self.cities = []
        self.locations = []
        self.complete = true
    }

    public init(_ items: [DepartureItem], complete: Bool) {
        self.items = items
        self.cities = []
        self.locations = []
        self.complete = complete
    }
}
