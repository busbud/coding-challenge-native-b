//
//  URLProtocol.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation

final class URLProtocolMock: URLProtocol {
    static var mockResponses: [URLRequest: (Data?, HTTPURLResponse?, Error?)] = [:]
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let (data, response, error) = URLProtocolMock.mockResponses[request] {
            if let error = error {
                client?.urlProtocol(self, didFailWithError: error)
            } else {
                if let response = response {
                    client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
                }
                if let data = data {
                    client?.urlProtocol(self, didLoad: data)
                }
                client?.urlProtocolDidFinishLoading(self)
            }
        } else {
            client?.urlProtocol(self, didFailWithError: URLError(.badURL))
        }
    }
    
    static func reset() {
        mockResponses.removeAll()
    }
    
    override func stopLoading() {}
}
