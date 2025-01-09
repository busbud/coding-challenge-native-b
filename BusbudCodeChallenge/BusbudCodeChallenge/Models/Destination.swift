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
    var distance: Double? { get set }
}

struct Destination: DestinationDefinition, Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let region: String
    let country: String
    let latitude: Double
    let longitude: Double
    let geohash: String
    var distance: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "place_id"
        case name = "city_name"
        case region = "region_name"
        case country = "country_name"
        case latitude = "lat"
        case longitude = "lon"
        case geohash
    }
    
    static func == (lhs: Destination, rhs: Destination) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.region == rhs.region &&
        lhs.country == rhs.country &&
        lhs.latitude == rhs.latitude &&
        lhs.longitude == rhs.longitude &&
        lhs.geohash == rhs.geohash &&
        lhs.distance == rhs.distance
    }
}

struct Destinations: Codable {
    let destinations: [Destination]
    
    enum CodingKeys: String, CodingKey {
        case destinations = "suggestions"
    }
}

