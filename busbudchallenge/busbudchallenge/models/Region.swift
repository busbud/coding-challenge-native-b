//
//  Region.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 3/11/20.
//

import Foundation

struct Region: Codable {
    var id: Int
    var locale: String
    var countryCode: String?
    var name: String
    var country: Country
    
    enum CodingKeys: String, CodingKey {
        case id
        case locale
        case countryCode = "country_code"
        case name
        case country
    }
}
