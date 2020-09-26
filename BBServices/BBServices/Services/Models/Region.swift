//
//  Region.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

// MARK: - Region
public struct Region: Codable {
    
    public let id: Int
    public let regionCode, countryCode2, name, shortName: String
    public let locale: String
    public let country: Country

    private enum CodingKeys: String, CodingKey {
        case id
        case regionCode = "region_code"
        case countryCode2 = "country_code2"
        case name
        case shortName = "short_name"
        case locale, country
    }
}
