//
//  City.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

public struct City: Codable {
    
    public let id: String
    public let regionID: Int
    public let name: String
    public let lat, lon: Double
    public let geohash, timezone, imageURL, heroImageURL: String
    public let legacyURLForm, countryCode2, fullName, shortName: String
    public let locale: String
    public let region: Region

    private enum CodingKeys: String, CodingKey {
        case id
        case regionID = "region_id"
        case name, lat, lon, geohash, timezone
        case imageURL = "image_url"
        case heroImageURL = "hero_image_url"
        case legacyURLForm = "legacy_url_form"
        case countryCode2 = "country_code2"
        case fullName = "full_name"
        case shortName = "short_name"
        case locale, region
    }
}
