//
//  BusbudRepository.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//
import CoreLocation

enum FetchError: Error {
    case simulatedError
}

final class BusbudRepository: BusbudRepositoryAPIRequesting {
    let apiClient: APIClientRequesting
    
    init(apiClient: APIClientRequesting = APIClient()) {
        self.apiClient = apiClient
    }
    
    
    private func sortDestinationsByDrivableDistance(destinations: [Destination], from startCoordinate: CLLocationCoordinate2D) async throws -> [Destination] {
        let destinationsWithDistances: [Destination] = try await withThrowingTaskGroup(of: Destination.self) { group in
            for destination in destinations {
                group.addTask {
                    let destinationCoordinate = CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitude)
                    let distance = try await startCoordinate.getDrivableDistance(to: destinationCoordinate)
                    var destination = destination
                    destination.distance = distance
                    return destination
                }
            }
            
            var results: [Destination] = []
            for try await result in group {
                results.append(result)
            }
            return results
        }
        
        return destinationsWithDistances.sorted { $0.distance ?? 0.0 < $1.distance ?? 0.0 }.map { $0 }
    }
    
    func fetchNearByDestinations(latitude: Double, longitude: Double, limit: Int = 10, language: String = "en", sortByDistance:  Bool = true) async throws -> [Destination] {
        let response: Destinations = try await apiClient.request(PointsOfInterestEndpoint.fetchPointsOfInterestFor(latitude: latitude, longitude: longitude, limit: limit, language: language))
        
        let destinations = response.destinations
        
        if sortByDistance {
            return try await sortDestinationsByDrivableDistance(destinations: destinations, from: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        }
        
        return destinations
    }
}
