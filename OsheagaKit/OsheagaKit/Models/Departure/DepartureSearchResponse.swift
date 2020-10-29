//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public typealias CityId = String
public typealias GeoHash = String

public struct DepartureSearchResponse: Decodable {

    let origin: CityId
    let destination: CityId
    let cities: [City]
    let locations: [Location]
    let operators: [Operator]
    let departures: [Departure]
    let complete: Bool
    let ttl: Int
    let isValidRoute: Bool

    enum CodingKeys: String, CodingKey {
        case origin = "origin_city_id"
        case destination = "destination_city_id"
        case cities
        case locations
        case operators
        case departures
        case complete
        case ttl
        case isValidRoute = "is_valid_route"
    }
}

extension DepartureSearchResponse {

    func location(for id: Int) -> Location? {
        locations.first { $0.id == id }
    }

    func city(for id: CityId) -> City? {
        cities.first { $0.id == id }
    }

    func operatorProvider(for id: String) -> Operator? {
        operators.first { $0.id == id }
    }
}
