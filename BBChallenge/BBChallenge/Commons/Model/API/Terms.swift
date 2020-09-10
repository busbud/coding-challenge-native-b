// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let terms = try? newJSONDecoder().decode(Terms.self, from: jsonData)

import Foundation

// MARK: - Terms
struct Terms: Codable {
    let refund, exchange, bagAllowed, pieceOfID: Bool
    let boardingRequirement: String
    let extraBagPolicy, useNewTicket: Bool
    let exchangeCutoff, nbCheckedBags, kgByBag, nbCarryOn: Int
    let extraBagCost: Int

    enum CodingKeys: String, CodingKey {
        case refund, exchange
        case bagAllowed = "bag_allowed"
        case pieceOfID = "piece_of_id"
        case boardingRequirement = "boarding_requirement"
        case extraBagPolicy = "extra_bag_policy"
        case useNewTicket = "use_new_ticket"
        case exchangeCutoff = "exchange_cutoff"
        case nbCheckedBags = "nb_checked_bags"
        case kgByBag = "kg_by_bag"
        case nbCarryOn = "nb_carry_on"
        case extraBagCost = "extra_bag_cost"
    }
}
