//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct DeparturePathParameter: PathParameter {

    public let origin: GeoHash
    public let destination: GeoHash
    public let outboundDate: Date
    public let poll: Bool

    public init(origin: GeoHash, destination: GeoHash, outboundDate: Date, poll: Bool = false) {
        self.origin = origin
        self.destination = destination
        self.outboundDate = outboundDate
        self.poll = poll
    }

    public func configurePath(url: URL) -> URL {
        var url = url
            .appendingPathComponent("x-departures")
            .appendingPathComponent(origin)
            .appendingPathComponent(destination)
            .appendingPathComponent(ISO8601DateFormatter.shortDateFormatter.string(from: outboundDate))
        if poll {
            url.appendPathComponent("poll")
        }
        return url
    }
}
