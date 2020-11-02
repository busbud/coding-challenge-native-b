//
//  City.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct City: Codable {
    var id: String?
    var locale: String?
    var regionID: Int?
    var name: String?
    var lat: Double?
    var lon: Double?
    var geohash: String?
    var timezone: String?
    var imageUrl: String?
    var legacyUrlForm: String?
    var fullName: String?
    var region: Region?
    
    enum CodingKeys: String, CodingKey {
        case id
        case locale
        case regionID = "region_id"
        case name
        case lat
        case lon
        case geohash
        case timezone
        case imageUrl = "image_url"
        case legacyUrlForm = "legacy_url_form"
        case fullName = "full_name"
        case region
    }
}

struct Region: Codable {
    var id: Int
    var locale: String
    var countryCode: String?
    var name: String
    var country: Country
    
    enum CodingKeys: String, CodingKey {
        case id
        case locale
        case countryCode = "country_code"
        case name
        case country
    }
}

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
