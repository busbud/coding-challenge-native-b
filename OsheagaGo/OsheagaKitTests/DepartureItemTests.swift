//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation
import XCTest
@testable import OsheagaKit

class DepartureItemTests: XCTestCase {

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

    func test_result_first_item_departure() {
        let first = result.items.first!
        XCTAssertEqual(first.departure.name, "Gare du Palais")
        XCTAssertEqual(first.departure.time, "4:30 AM")
        XCTAssertEqual(first.departure.city, "Quebec City")
    }

    func test_result_first_item_arrival() {
        let first = result.items.first!
        XCTAssertEqual(first.arrival.name, "Gare d'autocars")
        XCTAssertEqual(first.arrival.time, "7:45 AM")
        XCTAssertEqual(first.arrival.city, "Montreal")
    }

    func test_result_first_item_duration() {
        let first = result.items.first!
        XCTAssertEqual(first.duration, 11700.0)
        XCTAssertEqual(first.duration.stringFromTimeInterval, "03h15")
    }

    func test_result_first_item_price() {
        let first = result.items.first!
        XCTAssertEqual(first.price, "$52.85")
    }
}
