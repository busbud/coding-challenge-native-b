//
//  BBServicesTests.swift
//  BBServicesTests
//
//  Created by Nitin kachhadiya on 25/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import XCTest
@testable import BBServices

class BBServicesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let configuration = Configuration.shared
        configuration.isLoggigEnable = true
        configuration.serviceType = ServiceType.staging
        
        Services.shared.initSDK(with: configuration) { (state, error) in
            
            if state == InitalizeState.completed {
                
            }
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDeparturesService() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "test")
       
        let language = Language.languages.first(where: {$0.alpha2 == "en"})!
        let currency = Currency.currencies.first(where: {$0.code == "USD"})!
        let request = DeparturesRequest(origin: "f25dvk", destination: "dr5reg", on: Date(), adult: 1, child: 0, senior: 0, lang: language, currency: currency)
        
        Services.shared.executeDeparturesService(with: request) { (response, error) in
            
            XCTAssertNil(error)
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 40)
    }
    
    func testDeparturesServiceFailed() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "test")
       
        let language = Language.languages.first(where: {$0.alpha2 == "en"})!
        let currency = Currency.currencies.first(where: {$0.code == "USD"})!
        let request = DeparturesRequest(origin: "f25dv", destination: "dr5reg", on: Date(), adult: 1, child: 0, senior: 0, lang: language, currency: currency)
        
        Services.shared.executeDeparturesService(with: request) { (response, error) in
            
            XCTAssertNotNil(error)
            XCTAssertNil(response)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 40)
    }
}
