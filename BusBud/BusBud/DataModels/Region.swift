//
//  Region.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-08.
//

import Foundation

struct Region: Codable {
    let id: Int
    let regionCode: String
    let countryCode2: String
    let name: String
    let shortName: String
    let locale: String
    let country: Country

    enum CodingKeys: String, CodingKey {
        case id, name, locale, country
        case regionCode = "region_code"
        case countryCode2 = "country_code2"
        case shortName = "short_name"
    }
}
