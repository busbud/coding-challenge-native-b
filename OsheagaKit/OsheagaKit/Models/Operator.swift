//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct Operator: Decodable {

    let id: String
    let sourceID: Int
    let profileID: Int
    let name: String
    let logoURL: String
    let displayName: String
    let sellable: Bool
    let fuzzyPrices: Bool
    let referralDeal: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case sourceID = "source_id"
        case profileID = "profile_id"
        case name
        case logoURL = "logo_url"
        case displayName = "display_name"
        case sellable
        case fuzzyPrices = "fuzzy_prices"
        case referralDeal = "referral_deal"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        sourceID = try values.decode(Int.self, forKey: .sourceID)
        profileID = try values.decode(Int.self, forKey: .profileID)
        name = try values.decode(String.self, forKey: .name)
        logoURL = try values.decode(String.self, forKey: .logoURL)
        displayName = try values.decode(String.self, forKey: .displayName)
        sellable = try values.decode(Bool.self, forKey: .sellable)
        fuzzyPrices = try values.decode(Bool.self, forKey: .fuzzyPrices)
        referralDeal = try values.decode(Bool.self, forKey: .referralDeal)
    }
}
