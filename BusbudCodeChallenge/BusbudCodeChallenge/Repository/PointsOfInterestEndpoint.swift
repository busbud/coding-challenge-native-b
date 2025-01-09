//
//  PointsOfInterestEndpoint.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

import Foundation

enum PointsOfInterestEndpoint: APIEndpointConfigurable {
    case fetchPointsOfInterestFor(latitude: Double, longitude: Double, limit: Int, language: String)
    
    var method: HTTPMethod {
        switch self {
        case .fetchPointsOfInterestFor:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchPointsOfInterestFor:
            return "flex/suggestions/points-of-interest"
        }
    }
    
    var baseURL: String {
        return "https://napi.busbud.com"
    }
    
    var headers: [String: String] {
        return ["Accept": "application/vnd.busbud+json; version=3; profile=https://schema.busbud.com/v3/anything.json"]
    }
    
    var urlParams: [String: any CustomStringConvertible] {
        switch self {
        case .fetchPointsOfInterestFor(let latitude, let longitude, let limit, let language):
            return ["lat": latitude, "lon": longitude, "limit": limit, "language": language]
        }
    }
    
    var body: Data? {
        return nil
    }
    
    var apiVersion: APIVersion {
        .none
    }
}
