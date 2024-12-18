//
//  BusbudService.swift
//  busbud-coding-challenge
//
//  Created by Spencer Diniz on 17/12/24.
//

import Foundation
import CoreLocation

protocol BusbudServiceProtocol {
    func fetchSuggestions(for coordinate: CLLocationCoordinate2D) async throws -> [Suggestion]
}

public class BusbudService: BusbudServiceProtocol {
    public static let shared = BusbudService()

    private let supportedLanguages: [String: String] = [
        "en": "en",
        "pt": "pt"
    ]

    func fetchSuggestions(for coordinate: CLLocationCoordinate2D) async throws -> [Suggestion] {
        let deviceLanguage = Locale.current.language.languageCode?.identifier ?? "en"
        let currantLanguage = supportedLanguages[deviceLanguage] ?? "en"

        let url = URL(string: "https://napi.busbud.com/flex/suggestions/points-of-interest?lang=\(currantLanguage)&limit=100&lat=\(coordinate.latitude)&lon=\(coordinate.longitude)")!
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.httpMethod = "GET"
        request.addValue("application/vnd.busbud+json; version=3; profile=https://schema.busbud.com/v3/anything.json", forHTTPHeaderField: "Accept")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            //TODO: Check response codes and handle accordingly.
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                throw URLError(.badServerResponse)
            }

            let decoder = JSONDecoder()
            let suggestionResponse = try decoder.decode(SuggestionsResponse.self, from: data)
            var suggestionsWithDistance: [Suggestion] = []

            for var suggestion in suggestionResponse.suggestions {
                let suggestionLocation = CLLocation(latitude: suggestion.lat, longitude: suggestion.lon)
                let distance = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude).distance(from: suggestionLocation)
                suggestion.distance = distance
                suggestionsWithDistance.append(suggestion)
            }

            let sortedSuggestions = suggestionsWithDistance.sorted { $0.distance ?? 0 < $1.distance ?? 0 }
            return sortedSuggestions
        } catch {
            print("Failed to fetch suggestions: \(error)")
            throw error
        }
    }
}
