//
//  ApiEndpoints.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import Foundation

fileprivate var baseURL: String { return "https://napi.busbud.com/x-departures/%@/%@/%@%@" }

enum Endpoint {
    case search(from: String, to: String, date: String, poll: Bool = false)
    
    var urlString: String {
        switch self {
        case .search(let origin, let destination, let outboundDate, let poll):
            return String(format: baseURL, origin, destination, outboundDate, poll ? "/poll" : "")
        }
    }
}
