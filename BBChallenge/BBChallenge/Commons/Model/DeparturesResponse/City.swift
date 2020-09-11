// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let city = try? newJSONDecoder().decode(City.self, from: jsonData)

import Foundation

// MARK: - City
struct City: Codable {
    let id: String
    let regionID: Int
    let name: String
    let lat, lon: Double
    let geohash, timezone, imageURL, heroImageURL: String
    let legacyURLForm, countryCode2, fullName, shortName: String
    let locale: String
    let region: Region

    enum CodingKeys: String, CodingKey {
        case id
        case regionID = "region_id"
        case name, lat, lon, geohash, timezone
        case imageURL = "image_url"
        case heroImageURL = "hero_image_url"
        case legacyURLForm = "legacy_url_form"
        case countryCode2 = "country_code2"
        case fullName = "full_name"
        case shortName = "short_name"
        case locale, region
    }
}
