//
//  City.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import Foundation


struct City: Identifiable, Codable {
    
    let id: String
    var regionId: Int?
    
    var name: String
    var geohash: String
    
    var lat: Double?
    var lon: Double?
    
    var locale: String?
    var timezone: String?
    
    var imageUrl: String?
    var legacyUrlForm: String?
    
    var fullName: String?
    
    var region: Region?
    
}
