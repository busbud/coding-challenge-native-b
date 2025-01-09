//
//  APIEndpoint.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

import Foundation

enum APIEndpoint { }

extension APIEndpoint: APIEndpointConfigurable {
    var apiVersion: APIVersion {
        .v1
    }
    
    var baseURL: String {
        return ""
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return ""
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    var urlParams: [String: any CustomStringConvertible] {
        return [:]
    }
    
    var body: Data? {
        return nil
    }
}
