//
//  City.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

public struct City: Codable {
    
    public let id: String
    public let regionID: Int
    public let name: String
    public let lat, lon: Double
    public let geohash, timezone, imageURL, heroImageURL: String
    public let legacyURLForm, countryCode2, fullName, shortName: String
    public let locale: String
    public let region: Region

    private enum CodingKeys: String, CodingKey {
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

//TODO: Remove once we get list from service
public typealias defaultCities = [City]

extension City {
     
    public static let defaultCities: [City] = [
        
        City(id:"1",regionID:1,name:"New York",lat:0, lon: 0, geohash:"dr5reg",timezone:"",imageURL:"",heroImageURL:"",legacyURLForm:"",countryCode2:"",fullName:"",shortName:"",locale:"",region:Region(id: 1, regionCode: "1", countryCode2: "1", name: "1", shortName: "1", locale: "1", country: Country(code2: "1", code3: "", name: "", shortName: "", continent: "", defaultLocale: "", defaultCurrency: "", population: 1000, locale: ""))),
        City(id:"2",regionID:1,name:"Montréal",lat:0, lon: 0, geohash:"f25dvk",timezone:"",imageURL:"",heroImageURL:"",legacyURLForm:"",countryCode2:"",fullName:"",shortName:"",locale:"",region:Region(id: 1, regionCode: "1", countryCode2: "1", name: "1", shortName: "1", locale: "1", country: Country(code2: "1", code3: "", name: "", shortName: "", continent: "", defaultLocale: "", defaultCurrency: "", population: 1000, locale: "")))
    ]
}

