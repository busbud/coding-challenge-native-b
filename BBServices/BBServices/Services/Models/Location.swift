//
//  Location.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

public enum TypeEnum: String, Codable {
    case airport = "airport"
    case busStation = "bus_station"
    case busStop = "bus_stop"
    case other = "other"
    case subwayStation = "subway_station"
    case transitStation = "transit_station"
}

// MARK: - Location
public struct Location: Codable {
    
    public let id: Int
    public let cityID, name: String
    public let address: [String]
    public let type: TypeEnum
    public let lat, lon: Double?
    public let geohash: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case cityID = "city_id"
        case name, address, type, lat, lon, geohash
    }
}
