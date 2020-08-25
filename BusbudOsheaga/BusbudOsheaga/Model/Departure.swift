//
//  Departure.swift
//  BusbudOsheaga
//
//  Created by José Rafael Rocha on 2020-08-24.
//  Copyright © 2020 José Rafael Rocha. All rights reserved.
//

import Foundation

struct Departure: Codable {
    var identifier: String?
    var className: String?
    var amenities: EconomicClass?
    var availableSeats: Int?
    var prices: Prices?
    var departureTimezone: String?
    var arrivalTimezone: String?
    var departureTime: String?
    var arrivalTime: String?
    
    struct Prices: Codable {
        var total: Double?
    }
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case className = "class_name"
        case amenities
        case availableSeats = "available_seats"
        case prices
        case departureTimezone = "departure_timezone"
        case arrivalTimezone = "arrival_timezone"
        case departureTime = "departure_time"
        case arrivalTime = "arrival_time"
    }
    
}
