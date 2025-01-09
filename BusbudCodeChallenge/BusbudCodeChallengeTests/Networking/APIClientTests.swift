//
//  APIClientTests.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
import Testing
@testable import BusbudCodeChallenge

struct APIClientTests {
    
    func createMockSession(with responses: [URLRequest: (Data?, HTTPURLResponse?, Error?)]) -> URLSession {
//        URLProtocolMock.reset()
        
        let config = URLSessionConfiguration.ephemeral
        URLProtocolMock.mockResponses = responses
        config.protocolClasses = [URLProtocolMock.self]
        return URLSession(configuration: config)
    }
    
//    @Test
//    func testRequestSuccess() async throws {
//        let validJSON = """
//        {
//            "id": "123",
//            "name": "Sample Name"
//        }
//        """
//        let data = validJSON.data(using: .utf8)!
//        let response = HTTPURLResponse(url: URL(string: "https://mockapi.com/endpoint")!, statusCode: 200, httpVersion: nil, headerFields: nil)
//        let request = URLRequest(url: URL(string: "https://mockapi.com/endpoint")!)
//        
//        let session = createMockSession(with: [request: (data, response, nil)])
//        let apiClient = APIClient(session: session, logger: MockLogger())
//        let endpoint = MockAPIEndpoint(
//            method: .get,
//            path: "endpoint",
//            baseURL: "https://mockapi.com"
//        )
//        
//        struct MockResponse: Codable {
//            let id: String
//            let name: String
//        }
//        
//        let result: MockResponse = try await apiClient.request(endpoint)
//        #expect(result.id == "123")
//        #expect(result.name == "Sample Name")
//    }
    
    @Test
    func testRequestDecodingFailure() async throws {
        URLProtocolMock.reset()
        let invalidJSON = """
        {
            "unexpected_field": "unexpected_value"
        }
        """
        let data = invalidJSON.data(using: .utf8)!
        let response = HTTPURLResponse(url: URL(string: "https://mockapi.com/endpoint")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        let request = URLRequest(url: URL(string: "https://mockapi.com/endpoint")!)
        
        let session = createMockSession(with: [request: (data, response, nil)])
        let apiClient = APIClient(session: session, logger: MockLogger())
        let endpoint = MockAPIEndpoint(
            method: .get,
            path: "endpoint",
            baseURL: "https://mockapi.com"
        )
        
        struct MockResponse: Codable {
            let id: String
            let name: String
        }
        
        var didThrowError = false
        do {
            let r: MockResponse = try await apiClient.request(endpoint)
            print(r)
        } catch {
            didThrowError = true
            #expect(error is APIClientError)
        }
        
        #expect(didThrowError)
    }
    
    @Test
    func testRequestInvalidURL() async throws {
        let apiClient = APIClient()
        let invalidEndpoint = MockAPIEndpoint(
            method: .get,
            path: "invalid-url-endpoint",
            baseURL: "invalid-url"
        )
        
        var didThrowError = false
        do {
            let _: Data = try await apiClient.request(invalidEndpoint)
        } catch {
            didThrowError = true
            #expect(error is APIClientError)
        }
        #expect(didThrowError)
    }
    
//    @Test
//    func testRequestVoidSuccess() async throws {
//        let response = HTTPURLResponse(
//            url: URL(string: "https://mockapi.com/void_endpoint")!,
//            statusCode: 204,
//            httpVersion: nil,
//            headerFields: nil
//        )
//        let request = URLRequest(url: URL(string: "https://mockapi.com/void_endpoint")!)
//        let session = createMockSession(with: [request: (Data(), response, nil)])
//        let apiClient = APIClient(session: session, logger: MockLogger())
//        let endpoint = MockAPIEndpoint(
//            method: .post,
//            path: "void_endpoint",
//            baseURL: "https://mockapi.com"
//        )
//        
//        print("Request URL: \(endpoint.urlRequest?.url?.absoluteString ?? "Invalid URL")")
//        
//        var didThrowError = false
//        do {
//            try await apiClient.requestVoid(endpoint)
//        } catch {
//            didThrowError = true
//            print("Caught error: \(error)")
//        }
//        
//        #expect(!didThrowError)  // Expect no errors
//    }
    
    @Test
    func testRequestVoidNetworkError() async throws {
        let urlError = URLError(.notConnectedToInternet)
        let request = URLRequest(url: URL(string: "https://mockapi.com/network-error-endpoint")!)
        
        let session = createMockSession(with: [request: (nil, nil, urlError)])
        let apiClient = APIClient(session: session, logger: MockLogger())
        let endpoint = MockAPIEndpoint(
            method: .delete,
            path: "network-error-endpoint",
            baseURL: "https://mockapi.com"
        )
        
        var didThrowError = false
        var thrownError: Error?
        
        do {
            try await apiClient.requestVoid(endpoint)
        } catch {
            didThrowError = true
            thrownError = error
        }
        
        #expect(didThrowError)
        #expect(thrownError is APIClientError)
    }
    
    @Test
    func testRequestVoidServerError() async throws {
        let response = HTTPURLResponse(url: URL(string: "https://mockapi.com/server-error-endpoint")!, statusCode: 500, httpVersion: nil, headerFields: nil)
        let request = URLRequest(url: URL(string: "https://mockapi.com/server-error-endpoint")!)
        
        let session = createMockSession(with: [request: (nil, response, nil)])
        let apiClient = APIClient(session: session, logger: MockLogger())
        let endpoint = MockAPIEndpoint(
            method: .delete,
            path: "server-error-endpoint",
            baseURL: "https://mockapi.com"
        )
        
        var didThrowError = false
        var thrownError: Error?
        
        do {
            try await apiClient.requestVoid(endpoint)
        } catch {
            didThrowError = true
            thrownError = error
        }
        
        #expect(didThrowError)
        #expect(thrownError is APIClientError)
    }
}
