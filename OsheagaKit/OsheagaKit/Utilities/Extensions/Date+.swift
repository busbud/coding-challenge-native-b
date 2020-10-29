//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

extension Date {

    public init(iso8601 string: String) throws {
        guard let date = ISO8601DateFormatter.dateNoTimeZoneFormatter.date(from: string) else {
            throw OsheagaError.unableToDecodeDate(string)
        }
        self = date
    }

    public var iso8601String: String {
        ISO8601DateFormatter.dateFormatter.string(from: self)
    }
}
