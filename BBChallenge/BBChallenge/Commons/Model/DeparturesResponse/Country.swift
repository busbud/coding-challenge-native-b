// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let country = try? newJSONDecoder().decode(Country.self, from: jsonData)

import Foundation

// MARK: - Country
struct Country: Codable {
    let code2, code3, name, shortName: String
    let continent, defaultLocale, defaultCurrency: String
    let population: Int
    let locale: String

    enum CodingKeys: String, CodingKey {
        case code2, code3, name
        case shortName = "short_name"
        case continent
        case defaultLocale = "default_locale"
        case defaultCurrency = "default_currency"
        case population, locale
    }
}
