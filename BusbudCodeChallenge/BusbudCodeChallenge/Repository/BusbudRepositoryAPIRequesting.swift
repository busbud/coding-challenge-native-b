//
//  BusbudRepositoryAPIRequesting.swift.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

protocol BusbudRepositoryAPIRequesting {
    func fetchNearByDestinations(latitude: Double, longitude: Double, limit: Int, language: String, sortByDistance: Bool) async throws -> [Destination]
}
