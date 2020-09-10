// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let country = try? newJSONDecoder().decode(Country.self, from: jsonData)

import Foundation

// MARK: - Country
struct Country: Codable {
    let code2, locale, code3, name: String
    let continent, defaultLocale, defaultCurrency: String
    let population: Int

    enum CodingKeys: String, CodingKey {
        case code2, locale, code3, name, continent
        case defaultLocale = "default_locale"
        case defaultCurrency = "default_currency"
        case population
    }
}
