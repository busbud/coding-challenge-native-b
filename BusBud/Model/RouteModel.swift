//
//  RouteModel.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation

// MARK: - Route
struct RouteModel: Codable {
    var originCityID, destinationCityID: String
    var cities: [CityModel]
    var locations: [LocationModel]
    var operators: [OperatorModel]
    var departures: [DepartureModel]
    var searchRequestIDS: [String]
    var complete: Bool
    var ttl: Int
    var isValidRoute: Bool

    enum CodingKeys: String, CodingKey {
        case originCityID = "origin_city_id"
        case destinationCityID = "destination_city_id"
        case cities, locations, operators, departures
        case searchRequestIDS = "search_request_ids"
        case complete, ttl
        case isValidRoute = "is_valid_route"
    }
}

// MARK: - City
struct CityModel: Codable {
    var id: String
    var regionID: Int
    var name: String
    var lat, lon: Double
    var geohash, timezone, imageURL, heroImageURL: String
    var legacyURLForm, countryCode2, fullName, shortName: String
    var locale: String
    var region: RegionModel

    enum CodingKeys: String, CodingKey {
        case id
        case regionID = "region_id"
        case name, lat, lon, geohash, timezone
        case imageURL = "image_url"
        case heroImageURL = "hero_image_url"
        case legacyURLForm = "legacy_url_form"
        case countryCode2 = "country_code2"
        case fullName = "full_name"
        case shortName = "short_name"
        case locale, region
    }
}

// MARK: - Region
struct RegionModel: Codable {
    var id: Int
    var regionCode, countryCode2, name, shortName: String
    var locale: String
    var country: CountryModel

    enum CodingKeys: String, CodingKey {
        case id
        case regionCode = "region_code"
        case countryCode2 = "country_code2"
        case name
        case shortName = "short_name"
        case locale, country
    }
}




// MARK: - Country
struct CountryModel: Codable {
    var code2, code3, name, shortName: String
    var continent, defaultLocale, defaultCurrency: String
    var population: Int
    var locale: String

    enum CodingKeys: String, CodingKey {
        case code2, code3, name
        case shortName = "short_name"
        case continent
        case defaultLocale = "default_locale"
        case defaultCurrency = "default_currency"
        case population, locale
    }
}

// MARK: - Location
struct LocationModel: Codable {
    var id: Int
    var cityID, name: String
    var address: [String]
    var type: String //LocationType
    var lat, lon: Double?
    var geohash: String?

    enum CodingKeys: String, CodingKey {
        case id
        case cityID = "city_id"
        case name, address, type, lat, lon, geohash
    }
}

//enum LocationType: String, Codable {
//    case airport = "airport"
//    case busStation = "bus_station"
//    case busStop = "bus_stop"
//    case other = "other"
//}
