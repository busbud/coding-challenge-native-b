//
//  City.swift
//  BusBudiOSChallenge
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 17/12/24.
//

import Foundation

struct City: Identifiable, Decodable {
    let id: String
    let cityName: String
    let regionName: String
    let countryName: String
    let latitude: Double
    let longitude: Double
    let geohash: String
    var distance: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "place_id"
        case cityName = "city_name"
        case regionName = "region_name"
        case countryName = "country_name"
        case latitude = "lat"
        case longitude = "lon"
        case geohash
        case distance
    }
}

struct SuggestionsResponse: Decodable {
    let suggestions: [City]
}
