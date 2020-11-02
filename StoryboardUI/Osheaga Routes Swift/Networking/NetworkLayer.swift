//
//  NetworkLayer.swift
//  Osheaga Routes Swift
//
//  Created by user on 02/11/20.
//

import Foundation

protocol NetworkLayerProtocol {
    
    func getRoutes(from: City, to: City, at date: Date, for amountOfPeople: Int,
                   completion: @escaping (_ result: SearchResult?, _ error: Error?) -> Void)
    
    
}

class NetworkLayer: NetworkLayerProtocol {
    
    static let shared: NetworkLayerProtocol = NetworkLayer()
    
    private init(){}
    
    var defaultHeaders: [String : String] = ["X-Busbud-Token": AppSecrets.apiToken,
                                             "Accept": "application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/"]
    
    private enum Endpoint: String {
        case departures = "x-departures"
    }
    
    private enum AppLanguage: String {
        case english = "en"
        case french = "fr"
        case spanish = "es"
    }
    
    private enum AppCurrency: String {
        case canadianDollars = "CAD"
        case americanDollars = "USD"
        case euro = "EUR"
    }
    
    private func getURL(for endpoint: Endpoint) -> String {
        return AppSecrets.host + "/" + endpoint.rawValue
    }
    
}

extension NetworkLayer {
    
    private func buildURLComponents(from: City, to: City, at date: Date, for amountOfPeople: Int) -> URLComponents? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var rawURL = getURL(for: .departures)
        rawURL += "/" + from.geohash
        rawURL += "/" + to.geohash
        rawURL += "/" + dateFormatter.string(from: date)//"2020-11-02" //
        
        guard var urlComponents = URLComponents(string: rawURL) else { return nil}
        
        let language = AppLanguage.init(rawValue: Locale.current.languageCode ?? "en") ?? .english
        
        urlComponents.queryItems = []
        urlComponents.queryItems? += [URLQueryItem(name: "lang", value: language.rawValue)]
        urlComponents.queryItems? += [URLQueryItem(name: "currency", value: AppCurrency.canadianDollars.rawValue)]
        
        // Documentation was a little off, it is "adults" instead of "adult"
        // Weird thing about is that during the weekend it seems to work fine.
        
        urlComponents.queryItems? += [URLQueryItem(name: "adults", value: String(amountOfPeople))]
        
        return urlComponents
        
    }
    
    func getRoutes(from: City, to: City, at date: Date, for amountOfPeople: Int, completion: @escaping (_ result: SearchResult?, _ error: Error?) -> Void) {
                
        guard let urlComponents = buildURLComponents(from: from, to: to, at: date, for: amountOfPeople) else {
            completion(nil, NetworkErrorWrongConfig())
            return
        }
        
        
        guard let url = urlComponents.url else {
            completion(nil, NetworkErrorWrongConfig())
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        for defaultHeader in defaultHeaders {
            request.addValue(defaultHeader.value, forHTTPHeaderField: defaultHeader.key)
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil, NetworkErrorServerError())
                return
            }
            
            if let parsedData = data {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                
                    let searchResult = try decoder.decode(SearchResult.self, from: parsedData)
                    completion(searchResult, nil)
                    
                } catch let error {
                    completion(nil, error)
                }
                
            }
            
        }.resume()

    }
        
}
