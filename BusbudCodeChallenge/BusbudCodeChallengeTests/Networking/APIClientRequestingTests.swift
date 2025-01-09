//
//  APIClientRequestingTests.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
import Testing
@testable import BusbudCodeChallenge

struct APIClientRequestingTests {
    
    @Test
    func testRequestSuccess() async throws {
        let mockClient = MockAPIClient()
        
        struct MockResponse: Codable, Equatable {
            let id: String
            let name: String
        }
        
        let mockResponse = MockResponse(id: "123", name: "Sample Name")
        let endpoint = MockAPIEndpoint(
            method: .get,
            path: "sample-endpoint",
            baseURL: "https://mockapi.com"
        )
        
        mockClient.registerMockResponse(for: "sample-endpoint", response: mockResponse)
        
        let result: MockResponse = try await mockClient.request(endpoint)
        
        #expect(result == mockResponse)
    }
    
    @Test
    func testRequestVoidSuccess() async throws {
        let mockClient = MockAPIClient()
        let endpoint = MockAPIEndpoint(
            method: .post,
            path: "void-endpoint",
            baseURL: "https://mockapi.com"
        )
        
        mockClient.registerMockResponse(for: "void-endpoint", response: Data())
        
        var didThrowError = false
        do {
            try await mockClient.requestVoid(endpoint)
        } catch {
            didThrowError = true
        }
        
        #expect(!didThrowError)
    }
    
    @Test
    func testRequestDecodingFailure() async throws {
        let mockClient = MockAPIClient()
        
        let invalidJSON = """
        {
            "unexpected_field": "unexpected_value"
        }
        """
        let data = invalidJSON.data(using: .utf8)!
        
        let endpoint = MockAPIEndpoint(
            method: .get,
            path: "decoding-error-endpoint",
            baseURL: "https://mockapi.com"
        )
        
        mockClient.registerMockResponse(for: "decoding-error-endpoint", response: data)
        
        struct MockResponse: Codable {
            let id: String
            let name: String
        }
        
        var didThrowError = false
        var thrownError: Error?
        
        do {
            let _: MockResponse = try await mockClient.request(endpoint)
        } catch {
            didThrowError = true
            thrownError = error
        }
        
        #expect(didThrowError)
        #expect(thrownError is APIClientError)
    }
    
    @Test
    func testRequestVoidNetworkError() async throws {
        let mockClient = MockAPIClient()
        
        let endpoint = MockAPIEndpoint(
            method: .delete,
            path: "network-error-endpoint",
            baseURL: "https://mockapi.com"
        )
        
        mockClient.registerMockError(for: "network-error-endpoint", error: APIClientError.networkError(URLError(.notConnectedToInternet)))
        
        var didThrowError = false
        var thrownError: Error?
        
        do {
            try await mockClient.requestVoid(endpoint)
        } catch {
            didThrowError = true
            thrownError = error
        }
        
        #expect(didThrowError)
        #expect(thrownError is APIClientError)
    }
}
