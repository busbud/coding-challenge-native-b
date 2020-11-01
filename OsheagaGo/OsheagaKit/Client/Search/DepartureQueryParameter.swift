//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct DepartureQueryParameter: QueryParameter {

    public struct Passenger {

        public enum Key: String {
            case child
            case adult
            case senior
        }

        public let key: Key
        public let number: Int

        public init(key: Key, number: Int) {
            self.key = key
            self.number = number
        }
    }

    let passengers: [Passenger]
    let language: String
    let currency: String
    let index: Int?

    public init(child: Passenger, adult: Passenger, senior: Passenger, locale: Locale = .current, index: Int? = nil) {
        self.passengers = [child, adult, senior]
        self.language = locale.languageCode ?? "en"
        self.currency = locale.currencyCode ?? "CAD"
        self.index = index
    }

    public func configurePath(url: URL) -> URL {
        guard var urlComponents = URLComponents(string: url.absoluteString) else { return url }
        urlComponents.queryItems = paths.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return urlComponents.url ?? url
    }

    private var paths: [(String, String)] {
        var paths = passengers
            .filter { $0.number > 0 }
            .reduce(into: [(String, String)]()) { $0.append(($1.key.rawValue, "\($1.number)")) }

        paths.append(("lang", language))
        paths.append(("currency", currency))
        if let index = index {
            paths.append(("index", "\(index)"))
        }
        return paths
    }
}
