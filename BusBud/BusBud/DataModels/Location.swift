//
//  Location.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-08.
//

import Foundation

struct Location: Codable {
    let id: Int
    let cityID: String
    let name: String
    let address: [String]
    let latitude: Double?
    let longtitude: Double?
    let geohash: String?

    enum CodingKeys: String, CodingKey {
        case id, name, address, geohash
        case cityID = "city_id"
        case latitude = "lat"
        case longtitude = "lon"
    }
}
