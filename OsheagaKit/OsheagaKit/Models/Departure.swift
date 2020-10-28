//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct Departure: Decodable {

    let id: String
    let sourceID: Int
    let originLocationId: Int
    let destinationLocationId: Int
    let prices: Prices
    let departureTimezone: String
    let arrivalTimezone: String
    let departureTime: Date
    let arrivalTime: Date

    enum CodingKeys: String, CodingKey {
        case id
        case sourceID = "source_id"
        case originLocationId = "origin_location_id"
        case destinationLocationId = "destination_location_id"
        case prices
        case departureTimezone = "departure_timezone"
        case arrivalTimezone = "arrival_timezone"
        case departureTime = "departure_time"
        case arrivalTime = "arrival_time"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        sourceID = try values.decode(Int.self, forKey: .sourceID)
        originLocationId = try values.decode(Int.self, forKey: .originLocationId)
        destinationLocationId = try values.decode(Int.self, forKey: .destinationLocationId)
        prices = try values.decode(Prices.self, forKey: .prices)
        departureTimezone = try values.decode(String.self, forKey: .departureTimezone)
        arrivalTimezone = try values.decode(String.self, forKey: .arrivalTimezone)
        departureTime = try values.decode(Date.self, forKey: .departureTime)
        arrivalTime = try values.decode(Date.self, forKey: .arrivalTime)
    }
}
