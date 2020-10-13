//
//  Country.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-08.
//

import Foundation

struct Country: Codable {
    let code2: String
    let code3: String
    let name: String
    let shortName: String
    let continent: String
    let defaultLocale: String
    let defaultCurrency: String
    let population: Int
    let locale: String

    enum CodingKeys: String, CodingKey {
        case code2, code3, name, continent, population, locale
        case shortName = "short_name"
        case defaultLocale = "default_locale"
        case defaultCurrency = "default_currency"
    }
}
