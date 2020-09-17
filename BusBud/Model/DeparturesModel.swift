//
//  DeparturesModel.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation
// MARK: - DepartureModel
struct DepartureModel: Codable {
    var id: String
    var sourceID: Int
    var operatorID: String
    var originLocationID, destinationLocationID: Int
    var departureModelClass, className: String
    var amenities: AmenitiesModel
    var availableSeats: Int
    var prices: PricesModel?
    var ticketTypes: [String]
    var duration: Int
    var departureTimezone, arrivalTimezone, departureTime, arrivalTime: String

    enum CodingKeys: String, CodingKey {
        case id
        case sourceID = "source_id"
        case operatorID = "operator_id"
        case originLocationID = "origin_location_id"
        case destinationLocationID = "destination_location_id"
        case departureModelClass = "class"
        case className = "class_name"
        case amenities
        case availableSeats = "available_seats"
        case prices
        case ticketTypes = "ticket_types"
        case duration
        case departureTimezone = "departure_timezone"
        case arrivalTimezone = "arrival_timezone"
        case departureTime = "departure_time"
        case arrivalTime = "arrival_time"
    }
}

// MARK: - Amenities
struct AmenitiesModel: Codable {
    var displayName: String
    var wifi, toilet, ac, food: Bool
    var refreshment, powerOutlets, tv, busAttendant: Bool
    var legRoom: Bool

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case wifi, toilet, ac, food, refreshment
        case powerOutlets = "power_outlets"
        case tv
        case busAttendant = "bus_attendant"
        case legRoom = "leg_room"
    }
    
    init() {
        displayName = ""
        wifi = false
        toilet = false
        ac = false
        food = false
        refreshment = false
        powerOutlets = false
        tv = false
        busAttendant = false
        legRoom = false
    }
}

// MARK: - Prices
struct PricesModel: Codable {
    var total: Int
    var currency:String?
    var discounted: Bool?
}
