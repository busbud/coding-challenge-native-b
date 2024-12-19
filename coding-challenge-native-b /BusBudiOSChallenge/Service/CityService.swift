//
//  CityService.swift
//  BusBudiOSChallenge
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 17/12/24.
//

import Foundation

protocol URLBuilder {
    func buildURL(latitude: Double, longitude: Double) -> URL?
}

class BusBudURLBuilder: URLBuilder {
    func buildURL(latitude: Double, longitude: Double) -> URL? {
        let language = Locale.current.language.languageCode?.identifier ?? "en"
        return URL(string: "\(Constants.baseURL)?lat=\(latitude)&lon=\(longitude)&limit=\(Constants.limit)&lang=\(language)")
    }
}

protocol ResponseDecoder {
    func decodeResponse(data: Data) throws -> [City]
}

class DefaultResponseDecoder: ResponseDecoder {
    func decodeResponse(data: Data) throws -> [City] {
        let decoded = try JSONDecoder().decode(SuggestionsResponse.self, from: data)
        return decoded.suggestions
    }
}

class CityService {
    private let urlBuilder: URLBuilder
    private let responseDecoder: ResponseDecoder
    private let session: URLSession
    
    init(urlBuilder: URLBuilder = BusBudURLBuilder(),
         responseDecoder: ResponseDecoder = DefaultResponseDecoder(),
         session: URLSession = .shared) {
        self.urlBuilder = urlBuilder
        self.responseDecoder = responseDecoder
        self.session = session
    }
    
    func fetchNearbyCities(latitude: Double, longitude: Double, completion: @escaping (Result<[City], Error>) -> Void) {
        guard let url = urlBuilder.buildURL(latitude: latitude, longitude: longitude) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }
        
        var request = URLRequest(url: url)
        Constants.headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        session.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let cities = try self.responseDecoder.decodeResponse(data: data)
                    completion(.success(cities))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError(domain: "No Data", code: -1)))
            }
        }.resume()
    }
}

private struct Constants {
    static let baseURL = "https://napi.busbud.com/flex/suggestions/points-of-interest"
    static let headers = [
        "Accept": "application/vnd.busbud+json; version=3; profile=https://schema.busbud.com/v3/anything.json"
    ]
    static let limit = 25
}
