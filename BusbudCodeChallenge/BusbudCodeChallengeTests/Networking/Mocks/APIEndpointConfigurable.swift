//
//  APIEndpointConfigurable.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
@testable import BusbudCodeChallenge

struct MockAPIEndpoint: APIEndpointConfigurable {
    let method: HTTPMethod
    let path: String
    let baseURL: String
    let headers: [String: String]
    let urlParams: [String: any CustomStringConvertible]
    let body: Data?
    let apiVersion: APIVersion
    
    init(
        method: HTTPMethod = .get,
        path: String = "default-path",
        baseURL: String = "https://mockapi.com",
        headers: [String: String] = [:],
        urlParams: [String: any CustomStringConvertible] = [:],
        body: Data? = nil,
        apiVersion: APIVersion = .none
    ) {
        self.method = method
        self.path =  path
        self.baseURL = baseURL
        self.headers = headers
        self.urlParams = urlParams
        self.body = body
        self.apiVersion = apiVersion
    }
}

