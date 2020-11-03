//
//  Location.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct Location: Codable {
    var id: Int?
    var cityId: String?
    var name: String?
    var address: [String]?
    var type: String?
    var lat: Double?
    var lon: Double?
    var geohash: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case cityId = "city_id"
        case name
        case address
        case type
        case lat
        case lon
        case geohash
    }
    
    var displayName: String {
        return name ?? ""
    }
}
