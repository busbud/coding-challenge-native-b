// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let operator = try? newJSONDecoder().decode(Operator.self, from: jsonData)

import Foundation

// MARK: - Operator
struct Operator: Codable {
    let id: String
    let sourceID, profileID: Int
    let name: String
    let url: JSONNull?
    let logoURL, displayName: String
    let sellable, fuzzyPrices: Bool
    let sellTicketsCutoff: SellTicketsCutoff
    let amenities: OperatorAmenities
    let source: String
    let referralDeal: Bool
    let displayURL: JSONNull?
    let fraudCheck: String
    let terms: Terms

    enum CodingKeys: String, CodingKey {
        case id
        case sourceID = "source_id"
        case profileID = "profile_id"
        case name, url
        case logoURL = "logo_url"
        case displayName = "display_name"
        case sellable
        case fuzzyPrices = "fuzzy_prices"
        case sellTicketsCutoff = "sell_tickets_cutoff"
        case amenities, source
        case referralDeal = "referral_deal"
        case displayURL = "display_url"
        case fraudCheck = "fraud_check"
        case terms
    }
}
