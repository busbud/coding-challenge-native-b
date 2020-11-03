//
//  Location.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct Location: Codable {
    var id: Int
    var cityId: String
    var name: String
    var address: [String]
    var type: String
    var lat: Double?
    var lon: Double?
    var geohash: String?
    
    init(id: Int = 0,
         cityId: String = "",
         name: String = "",
         address: [String] = [],
         type: String = "",
         lat: Double = 0,
         lon: Double = 0,
         geohash: String) {
        self.id = id
        self.cityId = cityId
        self.name = name
        self.address = address
        self.type = type
        self.lat = lat
        self.lon = lon
        self.geohash = geohash
    }
    
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
}

// Dummie objects, locations should be pulled from API, this is only for testing proposes
extension Location {
    static let leavingFrom = Location(name: "Quebec", geohash: "f2m673")
    static let goingTo = Location(name: "Montreal", geohash: "f25dvk")
}
