//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct DepartureSearchResource: RestResource {
    
    public typealias Response = DepartureSearchResponse

    public let pathParam: DeparturePathParameter
    public let queryParam: DepartureQueryParameter

    public func request(for baseURL: URL) -> URLRequest {
        initRequest(url: baseURL, httpMethod: .get)
    }
}
