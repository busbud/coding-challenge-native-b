//  Created by Rafael Moraes on 15/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//
import Foundation
enum APIError: Error {
    case serverError(json: Any)
    case badRequest
    case parsingError
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .serverError(let json):
            if let jsonResult = json as? [String: AnyObject] {
                if let message = jsonResult["message"] as? String {
                    return message
                }
            }
            return "API error"
        case .badRequest:
            return "Bad Request"
        case .parsingError:
            return "JSON Parsing Error"
        }
        
    }
}
