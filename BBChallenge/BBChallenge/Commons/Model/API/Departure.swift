// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let departure = try? newJSONDecoder().decode(Departure.self, from: jsonData)

import Foundation

// MARK: - Departure
struct Departure: Codable {
    let id: String
    let sourceID: Int
    let checkoutType, operatorID: String
    let originLocationID, destinationLocationID: Int
    let departureClass, className: String
    let amenities: EconomyClass
    let availableSeats: Int
    let prices: Prices
    let ticketTypes: [String]
    let departureTimezone, arrivalTimezone, departureTime, arrivalTime: String

    enum CodingKeys: String, CodingKey {
        case id
        case sourceID = "source_id"
        case checkoutType = "checkout_type"
        case operatorID = "operator_id"
        case originLocationID = "origin_location_id"
        case destinationLocationID = "destination_location_id"
        case departureClass = "class"
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
