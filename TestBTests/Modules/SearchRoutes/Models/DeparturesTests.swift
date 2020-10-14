
import XCTest
@testable import TestB

class DeparturesTests: XCTestCase {

  private var sut: XDepartures!

    override func setUp() {
        sut = XCTContext.runActivity(named: "GIVEN x_departures response") { _ -> XDepartures in
          return MockFixture.loadFixtureFrom(fixture: MockFixture.x_departures)
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testXDepartures() {
      XCTContext.runActivity(named: "THEN XDepartures is populated properly") { _ in

        XCTAssertEqual(sut.locationName(locationID: 1942), "Métro Bonaventure Bus Station", "location name should be \"Métro Bonaventure Bus Station\"")
        XCTAssertNil(sut.locationName(locationID: 194366666), "location name should be \"nil\"")

        XCTAssertEqual(sut.currenyname(locationID: 1942), "USD", "currency name should be \"USD\"")
        XCTAssertNil(sut.currenyname(locationID: 194366666), "currency name should be \"nil\"")
        
      }
    }
  }

