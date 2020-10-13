//
//  Departure.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-08.
//

import Foundation

struct Departure: Codable {
    let id: String
    let sourceID: Int
    let operatorID: String
    let originLocationID: Int
    let destinationLocationID: Int
    let departureClass: String
    let className: String
    let availableSeats: Int
    let prices: Prices
    let ticketTypes: [String]
    let departureTimezone: String
    let arrivalTimezone: String
    let departureTime: String
    let arrivalTime: String

    enum CodingKeys: String, CodingKey {
        case id, prices
        case sourceID = "source_id"
        case operatorID = "operator_id"
        case originLocationID = "origin_location_id"
        case destinationLocationID = "destination_location_id"
        case departureClass = "class"
        case className = "class_name"
        case availableSeats = "available_seats"
        case ticketTypes = "ticket_types"
        case departureTimezone = "departure_timezone"
        case arrivalTimezone = "arrival_timezone"
        case departureTime = "departure_time"
        case arrivalTime = "arrival_time"
    }
}
