//
//  Operator.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 28/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

public struct Operator: Codable, Hashable {
    
    public let id: String
    public let sourceID, profileID: Int
    public let name: String
    public let url: JSONNull?
    public let logoURL, displayName: String
    public let sellable, fuzzyPrices: Bool
    public let sellTicketsCutoff: SellTicketsCutoff
    public let amenities: Amenities
    public let source: String
    public let referralDeal: Bool
    public let displayURL: JSONNull?
    public let fraudCheck: String
    public let terms: Terms

    private enum CodingKeys: String, CodingKey {
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

// MARK: - SellTicketsCutoff
public struct SellTicketsCutoff: Hashable, Codable {
    public let hours: Int
}
