// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let location = try? newJSONDecoder().decode(Location.self, from: jsonData)

import Foundation

// MARK: - Location
struct Location: Codable {
    let id: Int
    let cityID, name: String
    let address: [String]
    let type: TypeEnum
    let lat, lon: Double?
    let geohash: String?

    enum CodingKeys: String, CodingKey {
        case id
        case cityID = "city_id"
        case name, address, type, lat, lon, geohash
    }
}
