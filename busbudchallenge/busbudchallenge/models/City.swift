//
//  City.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct City: Codable {
    var id: String?
    var locale: String?
    var regionID: Int?
    var name: String?
    var lat: Double?
    var lon: Double?
    var geohash: String?
    var timezone: String?
    var imageUrl: String?
    var legacyUrlForm: String?
    var fullName: String?
    var region: Region?
    
    enum CodingKeys: String, CodingKey {
        case id
        case locale
        case regionID = "region_id"
        case name
        case lat
        case lon
        case geohash
        case timezone
        case imageUrl = "image_url"
        case legacyUrlForm = "legacy_url_form"
        case fullName = "full_name"
        case region
    }
}
