//
//  City.swift
//  BusbudOsheaga
//
//  Created by José Rafael Rocha on 2020-08-24.
//  Copyright © 2020 José Rafael Rocha. All rights reserved.
//

import Foundation

struct City: Codable {
    var identifier: String?
    var locale: String?
    var name: String?
    var fullName: String?
    var geohash: String?
    var timezone: String?
    var latitude: Double?
    var longitude: Double?
    var region: Region?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case locale
        case name
        case fullName = "full_name"
        case timezone
        case geohash
        case region
        case latitude = "lat"
        case longitude = "lon"
    }
    struct Region: Codable {
        
        var identifier: Int?
        var locale: String?
        var name: String?
        var countryCode: String?
        var country: Country?
        
        enum CodingKeys: String, CodingKey {
            case identifier = "id"
            case locale
            case name
            case countryCode = "country_code2"
        }
        
        struct Country: Codable {
            var name: String?
        }
    }
}
