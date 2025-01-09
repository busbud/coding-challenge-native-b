//
//  Destination.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import Foundation

protocol DestinationDefinition {
    var id: String { get }
    var name: String { get }
    var region: String { get }
    var country: String { get }
    var latitude: Double { get }
    var longitude: Double { get }
    var geohash: String { get }
}

struct Destination: DestinationDefinition, Codable, Identifiable {
    let id: String
    let name: String
    let region: String
    let country: String
    let latitude: Double
    let longitude: Double
    let geohash: String
    
    enum CodingKeys: String, CodingKey {
        case id = "place_id"
        case name = "city_name"
        case region = "region_name"
        case country = "country_name"
        case latitude = "lat"
        case longitude = "lon"
        case geohash
    }
}

struct Destinations: Codable {
    let destinations: [Destination]
    
    enum CodingKeys: String, CodingKey {
        case destinations = "suggestions"
    }
}
