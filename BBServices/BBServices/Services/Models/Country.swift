//
//  Country.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

public struct Country: Hashable, Codable  {
    
    public let code2, code3, name, shortName: String
    public let continent, defaultLocale, defaultCurrency: String
    public let population: Int
    public let locale: String

    private enum CodingKeys: String, CodingKey {
        case code2, code3, name
        case shortName = "short_name"
        case continent
        case defaultLocale = "default_locale"
        case defaultCurrency = "default_currency"
        case population, locale
    }
}
