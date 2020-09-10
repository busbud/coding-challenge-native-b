//
//  DeparturesCriteria.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import Foundation

/**
 Departures search criteria model
*/
struct DeparturesCriteria: Codable {
    
    /// Geohash of the origin destination
    let initialDestination: String
    /// Geohash of the final destination
    let finalDestination: String
    /// Date of departure
    let departureDate: String
    /// Number of Adults in departure search
    let adults: Int
    /// Number of children in departure search
    let children: Int
    /// Number of seniors in departure search
    let seniors: Int
    /// Language code with ISO 3166-1 alpha-2 format
    let language: String
    /// Currency code with  ISO 4217 format
    let currency: String
    
    
    enum CodingKeys: String, CodingKey {
        case initialDestination = "origin"
        case finalDestination = "destination"
        case departureDate = "outbound_date"
        case adults = "adult"
        case children = "child"
        case seniors = "senior"
        case language = "lang"
        case currency = "currency"
    }
}
