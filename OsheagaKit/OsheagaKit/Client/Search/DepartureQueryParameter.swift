//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct DepartureQueryParameter: QueryParameter {

    public struct Passenger {

        public enum Key: String {
            case adult
            case child
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

    public init(adult: Passenger, child: Passenger, senior: Passenger, locale: Locale = .current, index: Int? = nil) {
        self.passengers = [child, adult, senior]
        self.language = locale.languageCode ?? "en"
        self.currency = locale.currencyCode ?? "CAD"
        self.index = index
    }

    public func configurePath(url: URL) -> URL {
        guard var urlComponents = URLComponents(string: url.absoluteString) else { return url }
        urlComponents.queryItems = paths.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        return urlComponents.url ?? url
    }

    private var paths: [String: String] {
        var paths = passengers
            .filter { $0.number > 0 }
            .reduce(into: [String: String]()) { $0[$1.key.rawValue] = "\($1.number)" }

        paths["lang"] = language
        paths["currency"] = currency
        index.map { paths["index"] = "\($0)" }
        return paths
    }
}
