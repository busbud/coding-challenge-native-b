//
//  SearchResponse.swift
//  BusbudOsheaga
//
//  Created by José Rafael Rocha on 2020-08-24.
//  Copyright © 2020 José Rafael Rocha. All rights reserved.
//

import Foundation

struct SearchResponse: Codable {
    var cities: [City]?
    var location: [Location]?
    var operators: [Operator]?
    var departures: [Departure]?
    var complete: Bool = false
    var ttl: Int?
}
