//
//  Economy.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 28/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

// MARK: - Economy
public struct Economy: Hashable, Codable {
    public let displayName: String
    public let wifi, toilet, ac, food: Bool
    public let refreshment, powerOutlets, tv, busAttendant: Bool
    public let legRoom: Bool

    private enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case wifi, toilet, ac, food, refreshment
        case powerOutlets = "power_outlets"
        case tv
        case busAttendant = "bus_attendant"
        case legRoom = "leg_room"
    }
}
