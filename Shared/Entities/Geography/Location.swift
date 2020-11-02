//
//  Location.swift
//  Osheaga Routes
//
//  Created by user on 01/11/20.
//

import Foundation

struct Location: Codable {
    
    var id: Int
    var cityId: String?
    
    var name: String
    var geohash: String?
    
    var address: [String]?
    var type: String?
    
    var lat: Double?
    var lon: Double?
    
}
