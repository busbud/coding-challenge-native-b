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
}

// Dummie objects, locations should be pulled from API, this is only for testing proposes
extension Location {
    static var leavingFrom: Location {
        var loc = Location()
        loc.name = "Quebec"
        loc.geohash = "f2m673"
        return loc
    }
    static var goingTo: Location {
        var loc = Location()
        loc.name = "Montreal"
        loc.geohash = "f25dvk"
        return loc
    }
}
