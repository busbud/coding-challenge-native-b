//
//  APIError.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import Foundation

/**
`APIError` is the custom App Error type defines basic error types with default error messages.
 Conform `Error`
*/
public enum APIError: Error {

    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    case parsing(description: String)
    case network(description: String)
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        case .parsing: return "JSON Parsing Failure \(self.localizedDescription)"
        case .network: return "Network Failure \(self.localizedDescription)"
        }
    }
}
