//
//  Country.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 3/11/20.
//

import Foundation

struct Country: Codable {
    var code2: String
    var locale: String
    var code3: String
    var name: String
    var continent: String
    var defaultLocale: String
    var defaultCurrency: String
    var population: Int
    
    enum CodingKeys: String, CodingKey {
        case code2
        case locale
        case code3
        case name
        case continent
        case defaultLocale = "default_locale"
        case defaultCurrency = "default_currency"
        case population
    }
}
