// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let economyClass = try? newJSONDecoder().decode(EconomyClass.self, from: jsonData)

import Foundation

// MARK: - EconomyClass
struct EconomyClass: Codable {
    let displayName: String
    let wifi, toilet, ac, food: Bool
    let refreshment, powerOutlets, tv, busAttendant: Bool
    let legRoom: Bool

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case wifi, toilet, ac, food, refreshment
        case powerOutlets = "power_outlets"
        case tv
        case busAttendant = "bus_attendant"
        case legRoom = "leg_room"
    }
}
