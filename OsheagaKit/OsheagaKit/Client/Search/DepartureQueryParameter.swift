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
        var queryItems = passengers.filter { $0.number > 0 }.map { URLQueryItem(name: $0.key.rawValue, value: "\($0.number)") }
        queryItems.append(URLQueryItem(name: "lang", value: language))
        queryItems.append(URLQueryItem(name: "currency", value: currency))
        index.map { queryItems.append(URLQueryItem(name: "index", value: "\($0)")) }
        urlComponents.queryItems = queryItems
        return urlComponents.url ?? url
    }
}
