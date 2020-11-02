//
//  Search.swift
//  Osheaga Routes SwiftUITests
//
//  Created by user on 02/11/20.
//

import XCTest

class SearchUITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testBasicSearch() throws {
        
        
        let app = XCUIApplication()
        app.launch()
        
        // Dimissing onboarding
        app.swipeDown()
        
        
        // Let's make sure we are in the first step
        XCTAssert(app.staticTexts["Hit the search button above and check out the results"].exists)
        
        
        // Actually searching now
        app.buttons["SEARCH"].tap()
        
        
        // Waiting for results fetching
        expectation(for: NSPredicate(format: "exists == FALSE"),
                    evaluatedWith: app.staticTexts["Fetching results..."],
                    handler: nil)
        
        expectation(for: NSPredicate(format: "exists == FALSE"),
                    evaluatedWith: app.staticTexts["Hit the search button above and check out the results"],
                    handler: nil)
                    

        // We are gonna give 15sec tops
        waitForExpectations(timeout: 15, handler: nil)
        
        // And an extra seconds for UI operations to take place
        sleep(1)
        
        // If there's at least one results, success
        XCTAssert(XCUIApplication().tables.cells.count > 1)
                
    }

}
