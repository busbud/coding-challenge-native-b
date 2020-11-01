//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct Location: Decodable {

    let id: Int
    let cityId: CityId
    let name: String
    let address: [String]
    let geohash: GeoHash?

    enum CodingKeys: String, CodingKey {
        case id
        case cityId = "city_id"
        case name
        case address
        case geohash
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        cityId = try values.decode(CityId.self, forKey: .cityId)
        name = try values.decode(String.self, forKey: .name)
        address = try values.decode([String].self, forKey: .address)
        geohash = try values.decode(GeoHash?.self, forKey: .geohash)
    }
}
