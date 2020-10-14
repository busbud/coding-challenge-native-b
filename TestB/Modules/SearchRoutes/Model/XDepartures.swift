
import Foundation

struct XDepartures: Codable {
  let complete: Bool
  let locations: [Location]?
  let departures: [Departure]?
  let cities: [City]?

  func locationName(locationID: Int) -> String? {
    return location(for: locationID)?.name
  }

  func currenyname(locationID: Int) -> String? {
    guard let location = location(for: locationID), let cities = cities else { return nil }
    return cities.filter { city -> Bool in
      return city.id == location.city_id
      }.first?.region.country.default_currency
  }

  private func location(for locationID: Int) -> Location? {
    guard let locations = locations else { return nil }
    return locations.filter { location -> Bool in
              return location.id == locationID
           }.first
  }
}

struct Location: Codable {
  let id: Int
  let name: String
  let city_id: String
}

struct Departure: Codable {
  let id: String
  let departure_time: Date
  let arrival_time: Date
  let prices: Prices
  let origin_location_id: Int
}

struct Prices: Codable{
  let total: Double
}

struct City: Codable {
  let id: String
  let region: Region
}

struct Region: Codable {
  let country: Country
}

struct Country: Codable {
  let default_currency: String
}


extension Departure {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = try container.decode(String.self, forKey: .id)
    prices = try container.decode(Prices.self, forKey: .prices)
    origin_location_id = try container.decode(Int.self, forKey: .origin_location_id)

    let departure_time_Str = try container.decode(String.self, forKey: .departure_time)
    let arrival_time_Str = try container.decode(String.self, forKey: .arrival_time)

    let formatter = DateFormatter.iso8601Full

    if let departure_time = formatter.date(from: departure_time_Str) {
      self.departure_time = departure_time
    } else {
      throw DecodingError.dataCorruptedError(forKey: .departure_time, in: container, debugDescription: "Date string does not match format expected")
    }

    if let arrival_time = formatter.date(from: arrival_time_Str) {
      self.arrival_time = arrival_time
    } else {
      throw DecodingError.dataCorruptedError(forKey: .arrival_time, in: container, debugDescription: "Date string does not match format expected")
    }
  }
}
