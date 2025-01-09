//
//  APIEndpointConfigurable.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

import Foundation

enum APIVersion: String {
    case v1 = "v1"
    case none = ""
}

protocol APIEndpointConfigurable {
    var method: HTTPMethod { get }
    var path: String { get }
    var baseURL: String { get }
    var headers: [String: String] { get }
    var urlParams: [String: any CustomStringConvertible] { get }
    var body: Data? { get }
    var urlRequest: URLRequest? { get }
    var apiVersion: APIVersion { get }
}

extension APIEndpointConfigurable {
    
    var urlRequest: URLRequest? {
        guard var requestURL = URL(string: baseURL) else { return nil }
        if apiVersion != .none {
            requestURL.appendPathComponent(apiVersion.rawValue)
        }
        requestURL.appendPathComponent(path)
        
        let queryItems = urlParams.map { key, value in
            URLQueryItem(name: key, value: String(describing: value))
        }
        requestURL.append(queryItems: queryItems)
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        
        return request
    }
}
