//
//  Result.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct Response: Codable {
    var originCityId: String?
    var destinationCityId: String?
    var cities: [City]?
    var locations: [Location]?
    var operators: [Operator]?
    var departures: [XDeparture]?
    var complete: Bool?
    var ttl: Int?
    var isValidRoute: Bool?
    
    enum CodingKeys: String, CodingKey {
        case originCityId = "origin_city_id"
        case destinationCityId = "destination_city_id"
        case cities
        case locations
        case operators
        case departures
        case complete
        case ttl
        case isValidRoute = "is_valid_route"
    }
}
