//
//  CombineAPI.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import Foundation
import Combine

/// Generic structure for any API Fetcher with Combine
protocol CombineAPI {
    
    var session: URLSession { get }
    
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue,
                    retries: Int
    ) -> AnyPublisher<T, Error> where T: Decodable

}

extension CombineAPI {
    
    /// Generic call for any API Fetcher with Combine
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue = .main,
                    retries: Int = 0
    ) -> AnyPublisher<T, Error> where T: Decodable {
        return session.dataTaskPublisher(for: request)
            .mapError { error -> Error in
                APIError.network(description: error.localizedDescription)
        }
        .flatMap(maxPublishers: .max(1)) {
            decode($0.data)
        }
        .receive(on: queue)
        .retry(retries)
        .eraseToAnyPublisher()
    }
    
}
