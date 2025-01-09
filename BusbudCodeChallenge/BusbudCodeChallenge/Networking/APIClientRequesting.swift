//
//  APIClientRequesting.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

import Foundation

protocol APIClientRequesting {
    func request<T: Codable>(
        _ endpoint: APIEndpointConfigurable,
        decoder: JSONDecoder
    ) async throws -> T
    
    func requestVoid(
        _ endpoint: APIEndpointConfigurable
    ) async throws
}

extension APIClientRequesting {
    @discardableResult
    func request<T: Codable>(_ endpoint: APIEndpointConfigurable) async throws -> T {
        try await request(endpoint, decoder: JSONDecoder())
    }
}
