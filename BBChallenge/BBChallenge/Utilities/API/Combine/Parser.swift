//
//  Parser.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import Foundation
import Combine

/// Generic decode and parse handling and default date decoding strategy
func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, Error> {
    let decoder = JSONDecoder()
    
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      APIError.parsing(description: error.localizedDescription)
    }.eraseToAnyPublisher()
}
