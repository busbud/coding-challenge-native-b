//
//  Operator.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-08.
//

import Foundation

struct Operator: Codable {
    let id: String
    let sourceID: Int
    let profileID: Int
    let name: String
    let logoURL: String
    let displayName: String
    let sellable: Bool
    let fuzzyPrices: Bool
    let source: String
    let referralDeal: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, sellable, source
        case sourceID = "source_id"
        case profileID = "profile_id"
        case logoURL = "logo_url"
        case displayName = "display_name"
        case fuzzyPrices = "fuzzy_prices"
        case referralDeal = "referral_deal"
    }
}
