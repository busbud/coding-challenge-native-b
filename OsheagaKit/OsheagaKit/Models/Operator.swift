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

    public struct Parameter {
        public let width: Int
        public let height: Int
        public let fit: String = "fill"
        public let auto: String = "format"
        public let bgColor: String = "0FFF"

        public init(width: Int, height: Int) {
            self.width = width
            self.height = height
        }
    }

    public let stringUrl: String

    public init?(string: String?) {
        guard let string = string?.split(separator: "?").first else { return nil }
        self.stringUrl = String(string)
    }

    public func url(_ parameter: Parameter) -> URL? {
        guard let url = URL(string: stringUrl),
              var urlComponents = URLComponents(string: url.absoluteString)
        else { return nil }

        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "h", value: "\(parameter.height)"))
        queryItems.append(URLQueryItem(name: "w", value: "\(parameter.width)"))
        queryItems.append(URLQueryItem(name: "auto", value: "\(parameter.auto)"))
        queryItems.append(URLQueryItem(name: "fit", value: "\(parameter.fit)"))
        queryItems.append(URLQueryItem(name: "bg", value: "\(parameter.bgColor)"))
        urlComponents.queryItems = queryItems
        print(urlComponents.url)
        return urlComponents.url ?? url
    }
}

// Stub

extension Operator {

    public init() {
        self.id = ""
        self.name = "Orléans Express"
        self.logoURL = nil //SizedImageURL(string: "https://busbud.imgix.net/operator-logos/logo_orleans-express.png.png?h={height}&w={width}&auto=format&fit=fill&bg=0FFF")
        self.displayName = "Orléans Express"
    }

    public static func make() -> Operator {
        Operator()
    }
}
