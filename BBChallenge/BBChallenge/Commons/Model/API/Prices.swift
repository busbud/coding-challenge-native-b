// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let prices = try? newJSONDecoder().decode(Prices.self, from: jsonData)

import Foundation

// MARK: - Prices
struct Prices: Codable {
    let total: Int
    let breakdown: Breakdown
    let categories: Categories
    let discounted: Bool
}
