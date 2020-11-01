//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation
import XCTest
@testable import OsheagaKit

class DepartureSearchResultTests: XCTestCase {

    var response: DepartureSearchResponse!
    var result: DepartureSearchResult!

    override func setUp() {
        super.setUp()
        response = .make()
        result = DepartureSearchResult(response, cities: [], locations: [])
    }

    override func tearDown() {
        super.tearDown()
        response = nil
        result = nil
    }

    func test_result_items() {
        XCTAssertEqual(result.items.count, 5)
    }

    func test_result_cities() {
        XCTAssertEqual(result.cities.count, 2)
    }

    func test_result_locations() {
        XCTAssertEqual(result.locations.count, 33)
    }

    func test_result_operators() {
        XCTAssertEqual(response.operators.count, 1)
    }

    func test_result_departures() {
        XCTAssertEqual(response.departures.count, 5)
    }
}
