//
//  Terms.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 28/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

// MARK: - Terms
public struct Terms: Hashable, Codable {
    public let refund, exchange, bagAllowed, pieceOfID: Bool
    public let boardingRequirement: String
    public let extraBagPolicy, useNewTicket: Bool
    public let exchangeCutoff, nbCheckedBags, kgByBag, nbCarryOn: Int
    public let extraBagCost: Int

    private enum CodingKeys: String, CodingKey {
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
