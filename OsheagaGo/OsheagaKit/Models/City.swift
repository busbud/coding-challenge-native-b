//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct City: Decodable {

    let id: String
    let regionID: Int
    let name: String
    let latitude: Double
    let longitude: Double
    let geohash: GeoHash
    let timezone: String
    let imageURL: String?
    let heroImageURL: String
    let fullName: String
    let shortName: String
    let locale: String

    enum CodingKeys: String, CodingKey {
        case id
        case regionID = "region_id"
        case name
        case geohash
        case timezone
        case latitude = "lat"
        case longitude = "lon"
        case imageURL = "image_url"
        case heroImageURL = "hero_image_url"
        case fullName = "full_name"
        case shortName = "short_name"
        case locale
    }
}
