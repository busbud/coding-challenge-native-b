//
//  Region.swift
//  Osheaga Routes
//
//  Created by user on 01/11/20.
//

import Foundation

struct Region: Codable {
    
    var id: Int
    var name: String
    
    var locale: String
    var countryCode2: String
    
    var country: Country
    
}
