//
//  SearchService.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import Combine
import Foundation

class SearchService {
    
    static let shared = SearchService()
    
    enum Endpoint: String {
        case departures = "x-departures"
    }
    
    enum AppLanguage: String {
        case english = "en"
        case french = "fr"
        case spanish = "es"
    }
    
    enum AppCurrency: String {
        case canadianDollars = "CAD"
        case americanDollars = "USD"
        case euro = "EUR"
    }
    
    private func getURL(for endpoint: Endpoint) -> String {
        return AppSecrets.host + "/" + endpoint.rawValue
    }
    
}

extension SearchService {
    
    func getRoutes(from: City, to: City, at date: Date, for amountOfPeople: Int) -> AnyPublisher<SearchResult, Error>? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var rawURL = getURL(for: .departures)
        rawURL += "/" + from.geohash
        rawURL += "/" + to.geohash
        rawURL += "/" + dateFormatter.string(from: date)//"2020-11-02" //
        
        guard var urlComponents = URLComponents(string: rawURL) else { return nil }
        
        let language = AppLanguage.init(rawValue: Locale.current.languageCode ?? "en") ?? .english
        
        urlComponents.queryItems = []
        urlComponents.queryItems? += [URLQueryItem(name: "adult", value: String(amountOfPeople))]
        urlComponents.queryItems? += [URLQueryItem(name: "lang", value: language.rawValue)]
        urlComponents.queryItems? += [URLQueryItem(name: "currency", value: AppCurrency.canadianDollars.rawValue)]
        
        guard let url = urlComponents.url else { return nil }
        
        var request = URLRequest(url: url)
        
        let headerAccept = "application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/"
        
        request.httpMethod = "GET"
        request.addValue(headerAccept, forHTTPHeaderField: "Accept")
        request.addValue(AppSecrets.apiToken, forHTTPHeaderField: "X-Busbud-Token")
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .print()
            .map(\.data)
            .decode(type: SearchResult.self, decoder: decoder)
            .eraseToAnyPublisher()

    }
        
}
