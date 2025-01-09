//
//  BusbudRepositoryAPIRequesting.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
import Testing
@testable import BusbudCodeChallenge

final class MockBusbudRepository: BusbudRepositoryAPIRequesting {
    var mockDestinations: [Destination]?
    var shouldThrowError = false
    
    func fetchNearByDestinations(latitude: Double, longitude: Double, limit: Int, language: String, sortByDistance: Bool) async throws -> [Destination] {
        if shouldThrowError {
            throw NSError(domain: "MockErrorDomain", code: 1, userInfo: nil)
        }
        return mockDestinations ?? []
    }
}
