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
    let apiClient: APIClientRequesting
    
    init(apiClient: APIClientRequesting = APIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchNearByDestinations(latitude: Double, longitude: Double, _ limit: Int = 10, _ language: String = "en") async throws -> [Destination] {
        let response: Destinations = try await apiClient.request(PointsOfInterestEndpoint.fetchPointsOfInterestFor(latitude: latitude, longitude: longitude, limit: limit, language: language))
        return response.destinations
//        
//        // Simulate a delay
//        try await Task.sleep(nanoseconds: 1_000_000_000)
//        
//        // Generate a random outcome (1: Error, 2-4: Success, 5: Empty)
//        let outcome = Int.random(in: 1...10)
//        
//        switch outcome {
//        case 1...3:
//            // Throw a simulated error
//            print("Simulating an error response")
//            throw FetchError.simulatedError
//            
//        case 4...6:
//            // Simulate a successful response with a list of real cities around New York
//            let destinations = [
//                Destination(id: "1234", name: "Jersey City", region: "New Jersey", country: "USA", latitude: 40.7282, longitude: -74.0776, geohash: "asdf"),
//                Destination(id: "4567", name: "Hoboken", region: "New Jersey", country: "USA", latitude: 40.7433, longitude: -74.0288, geohash: "asdf"),
//                Destination(id: "7890", name: "Newark", region: "New Jersey", country: "USA", latitude: 40.7357, longitude: -74.1724, geohash: "asdf"),
//                Destination(id: "0987", name: "Yonkers", region: "New York", country: "USA", latitude: 40.9312, longitude: -73.8988, geohash: "asdf"),
//                Destination(id: "6543", name: "Stamford", region: "Connecticut", country: "USA", latitude: 41.0534, longitude: -73.5387, geohash: "asdf")
//            ]
//            
//            print("Simulating a successful response with \(destinations.count) destinations")
//
//            return destinations
//            
//        case 7...10:
//            // Simulate an empty response
//            print("Simulating an empty response")
//            return []
//            
//        default:
//            return []
//        }
    }
}
