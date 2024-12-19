//
//  CityViewModelTests.swift
//  BusBudiOSChallengeTests
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 18/12/24.
//

import Foundation
import XCTest
import CoreLocation
@testable import BusBudiOSChallenge

class CityViewModelTests: XCTestCase {
    
    var viewModel: CityViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CityViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchCities_success() {
        viewModel.userLocation = CLLocation(latitude: 0.0, longitude: 0.0)
        
        let mockCities = [
            City(id: "1", cityName: "City1", regionName: "Region1", countryName: "Country1", latitude: 0.0, longitude: 0.0, geohash: "abc123", distance: 0.0),
            City(id: "2", cityName: "City2", regionName: "Region2", countryName: "Country2", latitude: 1.0, longitude: 1.0, geohash: "def456", distance: 1.41)
        ]
        
        viewModel.cities = mockCities
        
        XCTAssertEqual(viewModel.cities.count, 2)
        XCTAssertEqual(viewModel.cities[0].cityName, "City1")
        XCTAssertEqual(viewModel.cities[1].distance, 1.41)
    }
    
    func testFetchCities_noUserLocation() {
        viewModel.userLocation = nil
        viewModel.fetchCities()
        switch viewModel.viewState {
        case .error(let errorMessage):
            XCTAssertEqual(errorMessage, "Localização não disponível.")
        default:
            XCTFail("Expected viewState to be .error with message 'Localização não disponível.'")
        }
    }

}
