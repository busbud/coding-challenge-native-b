//
//  CityServiceTests.swift
//  BusBudiOSChallengeTests
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 18/12/24.
//

import Foundation

import XCTest
@testable import BusBudiOSChallenge

class CityServiceTests: XCTestCase {
    
    func testBuildURL() {
        let urlBuilder = BusBudURLBuilder()
        let latitude = 51.5074
        let longitude = -0.1278

        let url = urlBuilder.buildURL(latitude: latitude, longitude: longitude)
        
        XCTAssertNotNil(url)
    }
    
    
    func testFetchNearbyCitiesSuccess() {

        let urlBuilder = BusBudURLBuilder()
        let responseDecoder = DefaultResponseDecoder()
        
        let mockSession = MockURLSession()
        let cityService = CityService(urlBuilder: urlBuilder, responseDecoder: responseDecoder, session: mockSession)
        
        let expectation = self.expectation(description: "Fetching cities")
        

        cityService.fetchNearbyCities(latitude: 51.5074, longitude: -0.1278) { result in
            switch result {
            case .success(let cities):
                XCTAssertEqual(cities.count, 1)
            case .failure(let error):
              break
            }
            expectation.fulfill()
        }
        
   
        mockSession.simulateSuccessResponse()
        
        waitForExpectations(timeout: 2, handler: nil)
    }
}


class MockURLSession: URLSession {
    var data: Data?
    var error: Error?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = MockURLSessionDataTask {
            completionHandler(self.data, nil, self.error)
        }
        return task
    }
    
    func simulateSuccessResponse() {
        let json = """
        {
            "suggestions": [
                {
                    "city": "London",
                    "country": "UK"
                }
            ]
        }
        """
        self.data = json.data(using: .utf8)
    }

    func simulateErrorResponse() {
        self.error = NSError(domain: "TestError", code: 500, userInfo: nil)
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}
