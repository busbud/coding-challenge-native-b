//
//  BusbudRepositoryAPIRequesting.swift.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

protocol BusbudRepositoryAPIRequesting {
    func fetchNearByDestinations(latitude: Double, longitude: Double, _ limit: Int, _ language: String) async throws -> [Destination]
}
