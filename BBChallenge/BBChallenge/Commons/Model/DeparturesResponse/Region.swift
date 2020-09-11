// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let region = try? newJSONDecoder().decode(Region.self, from: jsonData)

import Foundation

// MARK: - Region
struct Region: Codable {
    let id: Int
    let regionCode, countryCode2, name, shortName: String
    let locale: String
    let country: Country

    enum CodingKeys: String, CodingKey {
        case id
        case regionCode = "region_code"
        case countryCode2 = "country_code2"
        case name
        case shortName = "short_name"
        case locale, country
    }
}
