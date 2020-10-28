//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

extension Date {
    public init(iso8601 string: String) throws {
        guard let date = ISO8601DateFormatter.JSONDateFormatter.date(from: string) else {
            throw OsheagaError.unableToDecodeDate(string)
        }
        self = date
    }

    public var iso8601String: String {
        ISO8601DateFormatter.JSONDateFormatter.string(from: self)
    }

    public var iso8601DateOnlyString: String {
        ISO8601DateFormatter.JSONDateOnlyFormatter.string(from: self)
    }
}
