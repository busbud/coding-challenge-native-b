
import Foundation

public final class MockFixture {

  public static let x_departures = "x_departures"

  public static func loadFixtureFrom<T: Decodable>(fixture: String) -> T {
    let url = Bundle(for: MockFixture.self).path(forResource: fixture, ofType: "JSON")!
    let data = try! Data(contentsOf: URL(fileURLWithPath: url))
    return try! JSONDecoder().decode(T.self, from: data)
  }
}
