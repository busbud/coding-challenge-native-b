//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation
import XCTest
@testable import OsheagaKit

class DepartureURLTests: XCTestCase {

    var outboundDate: Date!
    var baseURL: URL!

    override func setUp() {
        super.setUp()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        outboundDate = formatter.date(from: "01-11-2020")
        baseURL = URL(string: "https://napi.busbud.com")!
    }

    override func tearDown() {
        super.tearDown()
        outboundDate = nil
    }

    func test_url_paths() {
        let param = DeparturePathParameter(origin: "f2m673", destination: "f25dvk", outboundDate: outboundDate)
        let url = param.configurePath(url: baseURL)
        XCTAssertEqual(url.absoluteString, "https://napi.busbud.com/x-departures/f2m673/f25dvk/2020-11-01")
    }

    func test_url_attributes_one_adult() {
        let param = DeparturePathParameter(origin: "f2m673", destination: "f25dvk", outboundDate: outboundDate)
        var url = param.configurePath(url: baseURL)

        let queryParam = DepartureQueryParameter(child: .init(key: .child, number: 0),
                                                 adult: .init(key: .adult, number: 1),
                                                 senior: .init(key: .senior, number: 0),
                                                 index: nil)
        url = queryParam.configurePath(url: url)
        XCTAssertEqual(url.absoluteString, "https://napi.busbud.com/x-departures/f2m673/f25dvk/2020-11-01?adult=1&lang=en&currency=USD")
    }

    func test_url_attributes_one_child() {
        let param = DeparturePathParameter(origin: "f2m673", destination: "f25dvk", outboundDate: outboundDate)
        var url = param.configurePath(url: baseURL)

        let queryParam = DepartureQueryParameter(child: .init(key: .child, number: 1),
                                                 adult: .init(key: .adult, number: 0),
                                                 senior: .init(key: .senior, number: 0),
                                                 index: nil)
        url = queryParam.configurePath(url: url)
        XCTAssertEqual(url.absoluteString, "https://napi.busbud.com/x-departures/f2m673/f25dvk/2020-11-01?child=1&lang=en&currency=USD")
    }

    func test_url_attributes_one_senior() {
        let param = DeparturePathParameter(origin: "f2m673", destination: "f25dvk", outboundDate: outboundDate)
        var url = param.configurePath(url: baseURL)

        let queryParam = DepartureQueryParameter(child: .init(key: .child, number: 0),
                                                 adult: .init(key: .adult, number: 0),
                                                 senior: .init(key: .senior, number: 1),
                                                 index: nil)
        url = queryParam.configurePath(url: url)
        XCTAssertEqual(url.absoluteString, "https://napi.busbud.com/x-departures/f2m673/f25dvk/2020-11-01?senior=1&lang=en&currency=USD")
    }

    func test_url_attributes_all() {
        let param = DeparturePathParameter(origin: "f2m673", destination: "f25dvk", outboundDate: outboundDate)
        var url = param.configurePath(url: baseURL)

        let queryParam = DepartureQueryParameter(child: .init(key: .child, number: 3),
                                                 adult: .init(key: .adult, number: 2),
                                                 senior: .init(key: .senior, number: 4),
                                                 index: nil)
        url = queryParam.configurePath(url: url)
        XCTAssertEqual(url.absoluteString, "https://napi.busbud.com/x-departures/f2m673/f25dvk/2020-11-01?child=3&adult=2&senior=4&lang=en&currency=USD")
    }

    func test_url_polling() {
        let param = DeparturePathParameter(origin: "f2m673", destination: "f25dvk", outboundDate: outboundDate, poll: true)
        var url = param.configurePath(url: baseURL)

        let queryParam = DepartureQueryParameter(child: .init(key: .child, number: 0),
                                                 adult: .init(key: .adult, number: 1),
                                                 senior: .init(key: .senior, number: 0),
                                                 index: 1)
        url = queryParam.configurePath(url: url)
        XCTAssertEqual(url.absoluteString, "https://napi.busbud.com/x-departures/f2m673/f25dvk/2020-11-01/poll?adult=1&lang=en&currency=USD&index=1")
    }
}
