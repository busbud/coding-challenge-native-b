
import XCTest
@testable import TestB

class DepartureCellModelTests: XCTestCase {
  private var sut: DepartureCellModel!

    override func setUp() {
        sut = XCTContext.runActivity(named: "GIVEN DepartureCell Model") { _ -> DepartureCellModel in
          return DepartureCellModel(id: "123", departureTime: Date(dateStr: "2021-07-29")!, arrivalTime: Date(dateStr: "2021-08-29")!, locationName: "abc", price: 101.12, currency: "USD")
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDepartureCellModel() {
        XCTContext.runActivity(named: "THEN timing and priceInfo is calculated properly") { _ in
          XCTAssertEqual(sut.timing, NSAttributedString(string: "Departure: 07-29-2021 00:00 \nArrival: 08-29-2021 00:00"), "timing text should be attributed text \"Departure: 07-29-2021 00:00 \nArrival: 08-29-2021 00:00\"")
          XCTAssertEqual(sut.priceInfo, "USD 101.12", "location name should be \"USD 101.12\"")
        }
    }


}
