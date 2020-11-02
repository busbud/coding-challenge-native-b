//
//  APIErrors.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import Foundation

enum APIError: Int, Error {
    case none
    case undefined
    case failConnection
    case failAuthentication
    case serverError
    case notFound
    case failParser
    init(status: APIStatus) {
        self = APIError(rawValue: Int(status.rawValue)) ?? .none
    }
    
    var status: APIStatus {
        return APIStatus(rawValue: Int(self.rawValue)) ?? .none
    }
}

enum APIStatus: Int {
    case none = 0
    case undefined = 1
    case failConnection = 2
    case failAuthentication = 3
    case serverError = 4
    case notFound = 5
    case failParser = 6
    case ok = 7
}

enum RequestError: Error {
    case unknown(message: String)
    
    var localizedDescription: String {
        switch self {
        case .unknown(let message):
            return "An error has ocurred trying to retrieve info from API: \(message)"
        }
    }
}
