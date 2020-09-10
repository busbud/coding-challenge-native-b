// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let busbudDeparturesJSON = try? newJSONDecoder().decode(BusbudDeparturesJSON.self, from: jsonData)

import Foundation

// MARK: - BusbudDeparturesJSON
struct BusbudDeparturesJSON: Codable {
    let originCityID, destinationCityID: String
    let cities: [City]
    let locations: [Location]
    let operators: [Operator]
    let departures: [Departure]
    let complete: Bool
    let ttl: Int
    let isValidRoute: Bool

    enum CodingKeys: String, CodingKey {
        case originCityID = "origin_city_id"
        case destinationCityID = "destination_city_id"
        case cities, locations, operators, departures, complete, ttl
        case isValidRoute = "is_valid_route"
    }
}

// MARK: - BusbudDeparturesResponse
typealias BusbudDeparturesResponse = [BusbudDeparturesJSON]
