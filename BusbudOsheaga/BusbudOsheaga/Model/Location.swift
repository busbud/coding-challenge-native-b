//
//  Location.swift
//  BusbudOsheaga
//
//  Created by José Rafael Rocha on 2020-08-24.
//  Copyright © 2020 José Rafael Rocha. All rights reserved.
//

import Foundation

struct Location: Codable {
    var identifier: Int?
    var cityId: String?
    var name: String?
    var address: [String]?
    var type: String?
    var geohash: String?
    var latitude: Double?
    var longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case cityId = "city_id"
        case name
        case address
        case type
        case geohash
        case latitude = "lat"
        case longitude = "lon"
    }
}
