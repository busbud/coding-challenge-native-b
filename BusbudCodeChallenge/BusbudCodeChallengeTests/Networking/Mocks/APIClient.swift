//
//  MockAPIClient.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
@testable import BusbudCodeChallenge

class MockAPIClient: APIClientRequesting {
    private var mockResponses: [String: Any] = [:]
    private var mockErrors: [String: Error] = [:]
    
    func registerMockResponse<T: Codable>(for endpointPath: String, response: T) {
        mockResponses[endpointPath] = response
    }
    
    func registerMockError(for endpointPath: String, error: Error) {
        mockErrors[endpointPath] = error
    }
    
    func request<T: Codable>(
        _ endpoint: APIEndpointConfigurable,
        decoder: JSONDecoder
    ) async throws -> T {
        let endpointKey = endpoint.path
        
        if let error = mockErrors[endpointKey] {
            throw error
        }
        
        guard let response = mockResponses[endpointKey] as? T else {
            throw APIClientError.decodingFailed(DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "No mock response available")))
        }
        
        return response
    }
    
    func requestVoid(_ endpoint: APIEndpointConfigurable) async throws {
        let endpointKey = endpoint.path
        
        if let error = mockErrors[endpointKey] {
            throw error
        }
    }
}
