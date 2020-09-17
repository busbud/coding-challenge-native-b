//
//  OperatorModel.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation
// MARK: - Operator
struct OperatorModel: Codable {
    var id: String
    var sourceID, profileID: Int
    var name: String
    var logoURL, displayName, reviewState: String
    var sellable, fuzzyPrices: Bool
    var sellTicketsCutoff: SellTicketsCutoff
    var defaultVehicleType, source: String
    var referralDeal: Bool
    var fraudCheck: String

    enum CodingKeys: String, CodingKey {
        case id
        case sourceID = "source_id"
        case profileID = "profile_id"
        case name
        case logoURL = "logo_url"
        case displayName = "display_name"
        case reviewState = "review_state"
        case sellable
        case fuzzyPrices = "fuzzy_prices"
        case sellTicketsCutoff = "sell_tickets_cutoff"
        case defaultVehicleType = "default_vehicle_type"
        case source
        case referralDeal = "referral_deal"
        case fraudCheck = "fraud_check"
    }
}


// MARK: - SellTicketsCutoff
struct SellTicketsCutoff: Codable {
    var minutes: Int
}
