//
//  BusbudFormatterTests.swift
//  Busbud
//
//  Created by Camille Kander on 2/16/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import XCTest
@testable import Busbud

class BusbudFormatterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPIDateFormatter() {
        
        let formatter = BusbudFormatter.APIDateFormatter
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        let date = NSDate(timeIntervalSince1970: NSTimeInterval(86400))
        XCTAssertEqual(formatter.stringFromDate(date), "1970-01-02")
    }
}
