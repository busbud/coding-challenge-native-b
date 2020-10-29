//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct DeparturePathParameter: PathParameter {

    public let origin: GeoHash
    public let destination: GeoHash
    public let outboundDate: Date

    public init(origin: GeoHash, destination: GeoHash, outboundDate: Date) {
        self.origin = origin
        self.destination = destination
        self.outboundDate = outboundDate
    }

    public func configurePath(url: URL) -> URL {
        url
            .appendingPathComponent("x-departures")
            .appendingPathComponent(origin)
            .appendingPathComponent(destination)
            .appendingPathComponent(ISO8601DateFormatter.shortDateFormatter.string(from: outboundDate))
    }
}
