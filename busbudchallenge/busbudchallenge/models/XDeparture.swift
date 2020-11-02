//
//  XDeparture.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct XDeparture: Codable {
    var id: String?
    var operatorID: String?
    var originLocationID: Int?
    var destinationLocationID: Int?
    var className: String?
    var availableSeats: Int?
    var prices: Price?
    var departureTimezone: String?
    var arrivalTimezone: String?
    var departureTime: String?
    var arrivalTime: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case operatorID = "operator_id"
        case originLocationID = "origin_location_id"
        case destinationLocationID = "destination_location_id"
        case className = "class_name"
        case availableSeats = "available_seats"
        case prices
        case departureTimezone = "departure_timezone"
        case arrivalTimezone = "arrival_timezone"
        case departureTime = "departure_time"
        case arrivalTime = "arrival_time"
    }
}

struct Price: Codable {
    var total: Int?
    var breakdown: [String: Int]?
    var discounted: Bool?
}
