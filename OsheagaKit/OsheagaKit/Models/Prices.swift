//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct Prices: Decodable {

    let currencyCode: String
    let total: Double
    let discount: Double

    enum CodingKeys: String, CodingKey {
        case currencyCode = "currency"
        case total
        case discount
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        currencyCode = try values.decode(String.self, forKey: .currencyCode)
        total = try values.decode(Double.self, forKey: .total)
        discount = try values.decode(Double.self, forKey: .discount)
    }
}
