//
//  DeparturesResponse.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import Foundation

struct DeparturesResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case originCityId = "origin_city_id"
        case destinationCityId = "destination_city_id"
        case cities
        case locations
        case xDepartures = "departures"
        case isCompleted = "complete"
    }
    
    let originCityId: String
    let destinationCityId: String
    let cities: [City]
    let xDepartures: [XDeparture]
    let locations: [Location]
    let isCompleted: Bool
}

extension DeparturesResponse {
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return df
    }()
}
