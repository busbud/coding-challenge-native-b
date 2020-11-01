//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct Operator: Decodable {

    public let id: String
    public let name: String
    public let logoURL: SizedImageURL?
    public let displayName: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoURL = "logo_url"
        case displayName = "display_name"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        logoURL = try SizedImageURL(string: values.decode(String?.self, forKey: .logoURL))
        displayName = try values.decode(String.self, forKey: .displayName)
    }
}
