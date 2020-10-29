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

public struct SizedImageURL {

    public let stringUrl: String

    public init?(string: String?) {
        guard let string = string else { return nil }
        self.stringUrl = string
    }

    public func url(width: Int, height: Int) -> URL? {
        let sizedStringUrl = stringUrl
            .replacingOccurrences(of: "{width}", with: "\(width)")
            .replacingOccurrences(of: "{height}", with: "\(height)")
        return URL(string: sizedStringUrl)
    }
}

// Stub

extension Operator {

    public init() {
        self.id = ""
        self.name = "Orléans Express"
        self.logoURL = SizedImageURL(string: "https://busbud.imgix.net/operator-logos/logo_orleans-express.png.png?h={height}&w={width}&auto=format&fit=fill&bg=0FFF")
        self.displayName = "Orléans Express"
    }

    public static func make() -> Operator {
        Operator()
    }
}
