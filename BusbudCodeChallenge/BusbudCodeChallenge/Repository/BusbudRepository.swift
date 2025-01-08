//
//  BusbudRepository.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

enum FetchError: Error {
    case simulatedError
}

final class BusbudRepository: BusbudRepositoryAPIRequesting {
    
    func fetchNearByDestinations(latitude: Double, longitude: Double, _ limit: Int?, _ language: String?) async throws -> [Destination] {
        // Simulate a delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        // Generate a random outcome (1: Error, 2-4: Success, 5: Empty)
        let outcome = Int.random(in: 1...5)
        
        switch outcome {
        case 1:
            // Throw a simulated error
            print("Simulating an error response")
            throw FetchError.simulatedError
            
        case 2...4:
            // Simulate a successful response with a list of real cities around New York
            let destinations = [
                Destination(id: "1234", name: "Jersey City", region: "New Jersey", country: "USA", latitude: 40.7282, longitude: -74.0776, geohash: "asdf"),
                Destination(id: "4567", name: "Hoboken", region: "New Jersey", country: "USA", latitude: 40.7433, longitude: -74.0288, geohash: "asdf"),
                Destination(id: "7890", name: "Newark", region: "New Jersey", country: "USA", latitude: 40.7357, longitude: -74.1724, geohash: "asdf"),
                Destination(id: "0987", name: "Yonkers", region: "New York", country: "USA", latitude: 40.9312, longitude: -73.8988, geohash: "asdf"),
                Destination(id: "6543", name: "Stamford", region: "Connecticut", country: "USA", latitude: 41.0534, longitude: -73.5387, geohash: "asdf")
            ]
            
            print("Simulating a successful response with \(destinations.count) destinations")
            
            if let limit = limit {
                return Array(destinations.prefix(limit)) // Return the requested limit of destinations
            }
            return destinations
            
        case 5:
            // Simulate an empty response
            print("Simulating an empty response")
            return []
            
        default:
            return []
        }
    }
}
