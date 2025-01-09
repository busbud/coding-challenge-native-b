//
//  PointsOfInterestEndpointTests.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
import Testing
@testable import BusbudCodeChallenge

struct PointsOfInterestEndpointTests {
    
    @Test
    func testFetchPointsOfInterestFor() {
        let latitude: Double = 37.7749
        let longitude: Double = -122.4194
        let limit: Int = 10
        let language: String = "en"
        
        let endpoint = PointsOfInterestEndpoint.fetchPointsOfInterestFor(latitude: latitude, longitude: longitude, limit: limit, language: language)
        
        #expect(endpoint.method == .get)
        #expect(endpoint.path == "flex/suggestions/points-of-interest")
        #expect(endpoint.baseURL == "https://napi.busbud.com")
        
        let expectedHeader = "application/vnd.busbud+json; version=3; profile=https://schema.busbud.com/v3/anything.json"
        #expect(endpoint.headers["Accept"] == expectedHeader)
        
        let urlParams = endpoint.urlParams
        #expect(urlParams["lat"] as? Double == latitude)
        #expect(urlParams["lon"] as? Double == longitude)
        #expect(urlParams["limit"] as? Int == limit)
        #expect(urlParams["language"] as? String == language)
        
        #expect(endpoint.body == nil)
        
        guard let requestURL = endpoint.urlRequest?.url else {
            #expect(Bool(false), "URLRequest was nil")
            return
        }
        
        let expectedURL = "https://napi.busbud.com/flex/suggestions/points-of-interest?lat=\(latitude)&lon=\(longitude)&limit=\(limit)&language=\(language)"
        guard let expectedComponents = URLComponents(string: expectedURL),
              let actualComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false) else {
            #expect(Bool(false), "Failed to parse URLComponents")
            return
        }
        
        let expectedQueryItems = expectedComponents.queryItems ?? []
        let actualQueryItems = actualComponents.queryItems ?? []
        
        let expectedQueryDict = Dictionary(uniqueKeysWithValues: expectedQueryItems.map { ($0.name, $0.value) })
        let actualQueryDict = Dictionary(uniqueKeysWithValues: actualQueryItems.map { ($0.name, $0.value) })
        
        #expect(expectedQueryDict == actualQueryDict, "Query parameters do not match")
        
        #expect(endpoint.urlRequest?.httpMethod == "GET")
        #expect(endpoint.urlRequest?.allHTTPHeaderFields?["Accept"] == expectedHeader)
    }
}
