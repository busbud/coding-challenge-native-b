//
//  DIstanceCalculateTests.swift
//  BusBudiOSChallengeTests
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 18/12/24.
//

import XCTest
import CoreLocation
@testable import BusBudiOSChallenge

class DistanceCalculationTests: XCTestCase {
    
    func testDistanceCalculation() {
        let userLocation = CLLocation(latitude: 0.0, longitude: 0.0)
        let city = City(id: "1", cityName: "City1", regionName: "Region1", countryName: "Country1", latitude: 1.0, longitude: 1.0, geohash: "abc123", distance: nil)
        
        let distance = userLocation.distance(to: city)

        XCTAssertEqual(distance, 157.2493803492997, accuracy: 0.1)
    }
}
