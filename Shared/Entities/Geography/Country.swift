//
//  Country.swift
//  Osheaga Routes
//
//  Created by user on 01/11/20.
//

import Foundation

struct Country: Codable {
    
    var name: String
    
    var locale2: String?
    
    var code2: String?
    var code3: String?
    
    var population: Int?
    var continent: String?
    
    var default_locale: String?
    var default_currency: String?
    
}
