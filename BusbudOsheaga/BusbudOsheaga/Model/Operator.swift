//
//  Operator.swift
//  BusbudOsheaga
//
//  Created by José Rafael Rocha on 2020-08-24.
//  Copyright © 2020 José Rafael Rocha. All rights reserved.
//

import Foundation

struct Operator: Codable {
    var name: String?
    var classes: Dictionary<String, EconomicClass>?
    var amenities: Amenities?
    
    struct Amenities: Codable {
        var classes: Dictionary<String, EconomicClass>?
    }
}
