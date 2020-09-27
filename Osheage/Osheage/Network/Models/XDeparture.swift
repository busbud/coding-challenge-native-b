//
//  XDeparture.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import Foundation

struct XDeparture: Codable {
    enum CodingKeys: String, CodingKey {
        case arrivalTime = "arrival_time"
        case departureTime = "departure_time"
        case destinationLocationId = "destination_location_id"
        case price = "prices"
    }
    
    let arrivalTime: Date
    let departureTime: Date
    let destinationLocationId: Int
    let price: Price
}

struct Price: Codable {
    let total: Int
}
