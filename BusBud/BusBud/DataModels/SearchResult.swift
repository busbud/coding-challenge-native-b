//
//  SearchResult.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-08.
//

import Foundation

struct SearchResult: Codable {
    let originCityID: String
    let destinationCityID: String
    let cities: [City]?
    let locations: [Location]
    let departures: [Departure]
    let operators: [Operator]
    let complete: Bool
    let ttl: Int
    let isValidRoute: Bool

    enum CodingKeys: String, CodingKey {
        case complete, ttl, cities, locations, operators, departures
        case originCityID = "origin_city_id"
        case destinationCityID = "destination_city_id"
        case isValidRoute = "is_valid_route"
    }
}
