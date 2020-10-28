//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public typealias CityId = String
public typealias GeoHash = String

public struct DepartureSearchResponse: Decodable {

    public let origin: CityId
    public let destination: CityId
    public let cities: [City]
    public let locations: [Location]
    public let operators: [Operator]
    public let departures: [Departure]
    public let complete: Bool
    public let ttl: Int
    public let isValidRoute: Bool

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
