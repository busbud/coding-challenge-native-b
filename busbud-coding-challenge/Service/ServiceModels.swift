//
//  ServiceModels.swift
//  busbud-coding-challenge
//
//  Created by Spencer Diniz on 17/12/24.
//

import Foundation
import CoreLocation

struct SuggestionsResponse: Codable {
    let suggestions: [Suggestion]
    let resultsType: String

    enum CodingKeys: String, CodingKey {
        case suggestions
        case resultsType = "results_type"
    }
}

struct Suggestion: Codable {
    let provider: String
    let id: String
    let placeID: String
    let geoEntityID: String
    let parentID: String?
    let label: String
    let score: Double
    let placeType: String
    let stopType: String
    let url: String
    let geohash: String
    let lat: Double
    let lon: Double
    let hierarchyInfo: HierarchyInfo
    let cityName: String
    let regionName: String
    let countryName: String
    let fullName: String
    let shortName: String
    let requestID: String
    var distance: Double?

    enum CodingKeys: String, CodingKey {
        case provider
        case id
        case placeID = "place_id"
        case geoEntityID = "geo_entity_id"
        case parentID = "parent_id"
        case label
        case score
        case placeType = "place_type"
        case stopType = "stop_type"
        case url
        case geohash
        case lat
        case lon
        case hierarchyInfo = "hierarchy_info"
        case cityName = "city_name"
        case regionName = "region_name"
        case countryName = "country_name"
        case fullName = "full_name"
        case shortName = "short_name"
        case requestID = "request_id"
    }

    var formattedDistanceInKm: String {
        guard let distance = distance else {
            return ""
        }

        return String(format: "%.2f km", distance / 1000)
    }

    var formattedDistanceInMiles: String {
        guard let distance = distance else {
            return ""
        }

        return String(format: "%.2f mi", distance / 1609.34)
    }

    var formattedDistance: String {
        return "\(formattedDistanceInKm) / \(formattedDistanceInMiles)"
    }
}

struct HierarchyInfo: Codable {
    let country: Country
    let region: Region
}

struct Country: Codable {
    let code: String?
    let name: String
}

struct Region: Codable {
    let code: String?
    let name: String
}
