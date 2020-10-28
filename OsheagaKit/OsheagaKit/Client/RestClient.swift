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

public extension Publisher {
    func logEvents(using log: OSLog, printOutput: Bool = false) -> Publishers.HandleEvents<Self> {
        handleEvents(receiveOutput: { output in
            if printOutput {
                os_log("Publisher %{private}@ received output: %{private}@", log: log, type: .default, String(describing: self), String(describing: output))
            } else {
                os_log("Publisher %{private}@ received output", log: log, type: .default, String(describing: self))
            }
        }, receiveCompletion: { completion in
            switch completion {
            case .finished:
                os_log("Publisher %{private}@ finished", log: log, type: .default, String(describing: self))
            case .failure(let error):
                os_log("Publisher %{private}@ failed with error: %{private}@", log: log, type: .fault, String(describing: self), String(describing: error))
            }
        }, receiveCancel: {
            os_log("Publisher %{private}@ cancelled", log: log, type: .default, String(describing: self))
        }, receiveRequest: { demand in
            os_log("Publisher %{private}@ received request with %{private}@ demand", log: log, type: .default, String(describing: self), String(describing: demand))
        })
    }
}


private extension OSLog {
    static let rest = OSLog(subsystem: "com.osheaga.kit", category: "BodyCoachRestClient")
}
