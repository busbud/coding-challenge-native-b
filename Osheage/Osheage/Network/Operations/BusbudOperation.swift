//
//  BusbudOperation.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import Foundation

enum ApiConfig {
    static var baseApiPath: String {
        return "https://napi.busbud.com/"
    }
    
    static var token: String {
        return "PARTNER_BaASYYHxTxuOINEOMWq5GA"
    }
    
    static var accept: String {
        return "application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/"
    }
}


class BusbudOperation: NetworkOperation {
    
    private(set) var jsonResponse: Any?
    
    override func prepareURLComponents() -> URLComponents? {
        guard let baseApiPath = URL(string: ApiConfig.baseApiPath) else { return nil }
        
        var urlComponents = URLComponents(url: baseApiPath, resolvingAgainstBaseURL: true)
        urlComponents?.path = endpoint
        urlComponents?.queryItems = queryItems
        return urlComponents
    }
    
    override func prepareHeaders() -> [String : String]? {
        return [
            "X-Busbud-Token": ApiConfig.token,
            "Accept": ApiConfig.accept,
        ]
    }
    
    override func processResponseData(_ data: Data?) {
        if let error = error {
            finish(with: error)
            return
        }
        guard let data = data else { return }
        
        do {
            jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.init(rawValue: 0))
            processJSONResponse()
        } catch {
            finish(with: RequestError.invalidJSONResponse)
        }
    }
    
    func processJSONResponse() {
        if let error = error {
            finish(with: error)
        } else {
            completed()
        }
    }
}

extension BusbudOperation {
    enum RequestError: Error {
        case invalidJSONResponse
        
        var localizedDescription: String {
            switch self {
            case .invalidJSONResponse:
                return "Invalid JSON response."
            }
        }
    }
}
