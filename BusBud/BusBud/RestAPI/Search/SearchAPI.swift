//
//  SearchAPI.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-07.
//

import Alamofire
import Foundation

struct SearchAPI {
    let base: String
    let method: HTTPMethod = .get
    let headers: HTTPHeaders

    init(base: String,
         header: [String: String] = Headers.defaultV2Header) {
        self.base = base
        self.headers = HTTPHeaders(header)
    }

    func buildURL(pathParams: SearchPathParams, needPoll: Bool) -> String {
        if needPoll {
            return base + "/x-departures/\(pathParams.origin)/\(pathParams.destination)/\(pathParams.date)/poll"
        }
        return base + "/x-departures/\(pathParams.origin)/\(pathParams.destination)/\(pathParams.date)/"
    }
}
