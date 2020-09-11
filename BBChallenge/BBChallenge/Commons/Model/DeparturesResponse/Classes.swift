// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let classes = try? newJSONDecoder().decode(Classes.self, from: jsonData)

import Foundation

// MARK: - Classes
struct Classes: Codable {
    let normal, economy: EconomyClass

    enum CodingKeys: String, CodingKey {
        case normal = "Normal"
        case economy = "Economy"
    }
}
