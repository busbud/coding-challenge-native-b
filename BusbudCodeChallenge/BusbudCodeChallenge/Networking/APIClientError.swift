//
//  APIClientError.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

import Foundation

enum APIClientError: Error {
    case invalidURL
    case invalidResponse(_ data: Data)
    case requestFailed(_ error: any Error)
    case decodingFailed(_ error: any Error)
    case notExpectedHttpResponseCode(code: Int)
    case urlRequestIsEmpty
    case statusCode(Int)
    case networkError(any Error)
}
