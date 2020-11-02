//
//  Departure.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import Foundation

struct SearchResult: Codable {
    
    var originCityId: String?
    var destinationCityId: String?
    
    var cities: [City]?
    
    var locations: [Location]?
    
    var operators: [Operator]?
    
    var departures: [Departure]?
    
    var complete: Bool?
    var ttl: Int?
    var isValidRoute: Bool?
}
