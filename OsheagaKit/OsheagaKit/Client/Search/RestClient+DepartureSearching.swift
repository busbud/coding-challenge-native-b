//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation
import Combine

public protocol DepartureSearching {
    func fetch(param: DeparturePathParameter, query: DepartureQueryParameter) -> AnyPublisher<DepartureSearchResponse, OsheagaError>
}

extension DepartureSearching where Self: RestClient {

    public func fetch(param: DeparturePathParameter, query: DepartureQueryParameter) -> AnyPublisher<DepartureSearchResponse, OsheagaError> {
        publisher(for: DepartureSearchResource(pathParam: param, queryParam: query))
            .mapError(OsheagaError.init(other:))
            .eraseToAnyPublisher()
    }
}
