// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let region = try? newJSONDecoder().decode(Region.self, from: jsonData)

import Foundation

// MARK: - Region
struct Region: Codable {
    let id: Int
    let locale, countryCode2, name: String
    let country: Country

    enum CodingKeys: String, CodingKey {
        case id, locale
        case countryCode2 = "country_code2"
        case name, country
    }
}
