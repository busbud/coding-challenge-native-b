//
//  Created by Rafael Moraes on 15/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation
import Alamofire

enum SearchRouter: Router, URLRequestConvertible {
    struct Keys {
        static let query = "q"
        static let projection = "projection"
        static let maxResults = "maxResults"
        static let startIndex = "startIndex"

    }

    case initSearch(baseUrl: String, searchParams: SearchParams)
    case pollSearch(baseUrl: String, searchParams: SearchParams)
    
    internal var httpMethod: HTTPMethod {
        switch self {
        case .initSearch, .pollSearch:
            return .get
        }
    }
    
    internal var path: String {
        switch self {
        case .initSearch( _, let searchParams):
            return "/x-departures/\(searchParams.origin!)/\(searchParams.destination!)/\(searchParams.date!)"
        case .pollSearch( _, let searchParams):
        return "/x-departures/\(searchParams.origin!)/\(searchParams.destination!)/\(searchParams.date!)/poll"
        }
    }

    internal var baseUrl: String {
        switch self {
        case .initSearch(let baseUrl, _), .pollSearch(let baseUrl, _):
            return baseUrl
        }
    }
    
    internal var parameters: [String: Any]? {
        switch self {
        case .initSearch:
            return ["adult": 1, "child": 0, "senior": 0, "lang": "en", "currency": "cad"]
        case .pollSearch:
            return ["adult": 1, "child": 0, "senior": 0, "lang": "en", "currency": "cad", "index": 0]
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = URL(string: baseUrl)!
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.addValue("no-cache", forHTTPHeaderField: "Cache-Control")
        urlRequest.addValue("application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/", forHTTPHeaderField: "Accept")
        urlRequest.addValue("GUEST_LHfJPbBsTgynDZ2vFXcL0Q", forHTTPHeaderField: "X-Busbud-Token")
        switch self {
        case .initSearch, .pollSearch:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        print("Request made")
        return urlRequest
    }
}
