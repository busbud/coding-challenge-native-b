//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation
import Combine
import os.log

public typealias OsheagaClientAPIs = DepartureSearching

public protocol OsheagaRestClient: class, OsheagaClientAPIs { }

public class RestClient: OsheagaRestClient {

    let session: URLSession
    let baseURL: URL

    public init(baseURL: URL, session: URLSession = URLSession.shared) {
        self.session = session
        self.baseURL = baseURL
    }

    func publisher<R: RestResource>(for resource: R, using decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<R.Response, Error> where R.Response: Decodable {
        session.publisher(for: resource.request(for: baseURL), using: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

private extension URLSession {
    
    func publisher<Response: Decodable>(for request: URLRequest, using decoder: JSONDecoder) -> AnyPublisher<Response, Error> {
        dataTaskPublisher(for: request)
            .tryMap { try decoder.decode(Response.self, from: $0.data) }
            .logEvents(using: .rest)
            .eraseToAnyPublisher()
    }
}

private extension OSLog {
    static let rest = OSLog(subsystem: "OsheagaKit", category: "BodyCoachRestClient")
}
