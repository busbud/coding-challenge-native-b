//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

enum LocationType: String, Decodable {
    case airport = "airport"
    case busStation = "bus_station"
    case busStop = "bus_stop"
    case other = "other"
    case subwayStation = "subway_station"
    case transitStation = "transit_station"
}

public struct Location: Decodable {

    let id: Int
    let cityID: CityId
    let name: String
    let address: [String]
    let type: LocationType
    let latitude: Double?
    let longitude: Double?
    let geohash: GeoHash?

    enum CodingKeys: String, CodingKey {
        case id
        case cityID = "city_id"
        case name
        case address
        case type
        case latitude = "lat"
        case longitude = "lon"
        case geohash
    }
}
