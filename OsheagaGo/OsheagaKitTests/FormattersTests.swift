//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import XCTest
@testable import OsheagaKit

class FormattersTests: XCTestCase {

    var referenceDate: Date!

    override func setUp() {
        super.setUp()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        referenceDate = formatter.date(from: "01-11-2020")
    }

    override func tearDown() {
        super.tearDown()
        referenceDate = nil
    }

    func test_iso8601_date_without_timezone_formatter() throws {
        let shortDate = ISO8601DateFormatter.dateNoTimeZoneFormatter.string(from: referenceDate)
        XCTAssertEqual(shortDate, "2020-11-01T00:00:00")
    }

    func test_iso8601_short_date_formatter() throws {
        let shortDate = ISO8601DateFormatter.shortDateFormatter.string(from: referenceDate)
        XCTAssertEqual(shortDate, "2020-11-01")
    }

}
