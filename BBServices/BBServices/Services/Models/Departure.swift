//
//  Departures.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 28/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

public struct Departure: Hashable, Codable, Identifiable {
    
    
    public let id: String
    public let sourceID: Int
    public let checkoutType, operatorID: String
    public let originLocationID, destinationLocationID: Int
    public let welcomeClass, className: String
    public let amenities: Amenities
    public let availableSeats: Int
    public let prices: Price
    public let ticketTypes: [String]
    public let departureTimezone, arrivalTimezone, departureTime, arrivalTime: String

    private enum CodingKeys: String, CodingKey {
        case id
        case sourceID = "source_id"
        case checkoutType = "checkout_type"
        case operatorID = "operator_id"
        case originLocationID = "origin_location_id"
        case destinationLocationID = "destination_location_id"
        case welcomeClass = "class"
        case className = "class_name"
        case amenities
        case availableSeats = "available_seats"
        case prices
        case ticketTypes = "ticket_types"
        case departureTimezone = "departure_timezone"
        case arrivalTimezone = "arrival_timezone"
        case departureTime = "departure_time"
        case arrivalTime = "arrival_time"
    }
}
