//
//  APIClient.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

import Foundation

private extension String {
    static let tokenWithSpace = "Token "
    static let authorization = "Authorization"
}

final class APIClient: APIClientRequesting {
    private let token: String?
    private let session: URLSession
    private let logger: Logging
    
    init(token: String? = nil, session: URLSession = .shared, logger: Logging = Logger()) {
        self.token = token
        self.session = session
        self.logger = logger
    }
    
    func request<T: Decodable>(
        _ endpoint: APIEndpointConfigurable,
        decoder: JSONDecoder
    ) async throws -> T {
        guard let request = endpoint.urlRequest else {
            throw APIClientError.invalidURL
        }
        
        let data = try await performRequest(request)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIClientError.decodingFailed(error)
        }
    }
    
    func requestVoid(
        _ endpoint: APIEndpointConfigurable
    ) async throws {
        guard let request = endpoint.urlRequest else {
            throw APIClientError.invalidURL
        }
        
        try await performRequest(request)
    }
}


private extension APIClient {
    
    @discardableResult
    private func performRequest(
        _ request: URLRequest
    ) async throws -> Data {
        var mutableRequest = request
        if let token = token {
            mutableRequest.addValue(.tokenWithSpace + String(token), forHTTPHeaderField: .authorization)
        }
        
        let session: URLSession = self.session
        
        do {
            let (data, response) = try await session.data(for: mutableRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIClientError.invalidResponse(data)
            }
            
            Logger.log("HTTP resonse: \(httpResponse)")
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIClientError.statusCode(httpResponse.statusCode)
            }
            
            return data
        } catch {
            if let urlError = error as? URLError {
                throw APIClientError.networkError(urlError)
            } else {
                throw APIClientError.requestFailed(error)
            }
        }
    }
}
