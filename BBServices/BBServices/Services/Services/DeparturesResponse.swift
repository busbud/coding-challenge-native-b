//
//  DeparturesResponse.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This class was designed and implemented for departures response model.
 */
public class DeparturesResponse: Codable {
    
    public let originCityID:String
    public let destinationCityID: String
    public let cities: [City]
    public let locations: [Location]
    let operators, departures: [JSONAny]
    public let searchRequestIDS: [String]
    public let complete: Bool
    public let ttl: Int
    public let isValidRoute: Bool

    private enum CodingKeys: String, CodingKey {
        case originCityID = "origin_city_id"
        case destinationCityID = "destination_city_id"
        case cities, locations, operators, departures
        case searchRequestIDS = "search_request_ids"
        case complete, ttl
        case isValidRoute = "is_valid_route"
    }
}
