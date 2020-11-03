//
//  Operator.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct Operator: Codable {
    var id: String?
    var name: String?
    var logo: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logo = "logo_url"
    }
}
