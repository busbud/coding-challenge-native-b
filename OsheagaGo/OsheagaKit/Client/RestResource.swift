//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation
import Keys

public enum HttpMethod: String {
    case get = "GET"
}

public protocol RestResource {

    associatedtype Response
    associatedtype PathParam: PathParameter
    associatedtype QueryParam: QueryParameter

    var pathParam: PathParam { get }
    var queryParam: QueryParam { get }

    func request(for baseURL: URL) -> URLRequest
    func initRequest(url: URL, httpMethod: HttpMethod) -> URLRequest
}

extension RestResource {

    public func initRequest(url: URL, httpMethod: HttpMethod) -> URLRequest {
        let url = queryParam.configurePath(url: pathParam.configurePath(url: url))
        var request = URLRequest(url: url)
        let keys = OsheagaGoKeys()
        request.httpMethod = httpMethod.rawValue
        request.addValue("application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/", forHTTPHeaderField: "Accept")
        request.addValue(keys.busbudToken, forHTTPHeaderField: "X-Busbud-Token")
        return request
    }
}
