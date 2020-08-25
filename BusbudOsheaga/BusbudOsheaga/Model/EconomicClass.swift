//
//  EconomicClass.swift
//  BusbudOsheaga
//
//  Created by José Rafael Rocha on 2020-08-24.
//  Copyright © 2020 José Rafael Rocha. All rights reserved.
//

import Foundation

struct EconomicClass: Codable {
    var name: String?
    var wifi: Bool?
    var toilet: Bool?
    var ac: Bool?
    var food: Bool?
    var refreshment: Bool?
    var powerOutlets: Bool?
    var tv: Bool?
    var busAttendant: Bool?
    var legRoom: Bool?
    
    enum CodingKeys: String, CodingKey {
        case name = "display_name"
        case wifi
        case toilet
        case ac
        case food
        case refreshment
        case powerOutlets = "power_outlets"
        case tv
        case busAttendant = "bus_attendant"
        case legRoom = "leg_room"
    }
}
