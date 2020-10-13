//
//  City.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-08.
//

import Foundation

struct City: Codable {
    let id: String
    let regionID: Int
    let name: String
    let latitude: Double
    let longtitude: Double
    let geohash: String
    let timezone: String
    let heroImageURL: String?
    let legacyURLForm: String
    let countryCode2: String
    let fullName: String
    let shortName: String
    let locale: String
    let region: Region

    enum CodingKeys: String, CodingKey {
        case id, name, geohash, timezone, region, locale
        case latitude = "lat"
        case longtitude = "lon"
        case regionID = "region_id"
        case heroImageURL = "hero_image_url"
        case legacyURLForm = "legacy_url_form"
        case countryCode2 = "country_code2"
        case fullName = "full_name"
        case shortName = "short_name"
    }
}
