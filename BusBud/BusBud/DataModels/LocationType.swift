//
//  LocationType.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-08.
//

import Foundation

enum LocationType: String, Codable {
    case airport = "airport"
    case busStation = "bus_station"
    case busStop = "bus_stop"
    case other = "other"
    case subwayStation = "subway_station"
    case transitStation = "transit_station"
}
