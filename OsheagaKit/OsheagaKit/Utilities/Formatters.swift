//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public extension TimeZone {

    static var utc = TimeZone(abbreviation: "UTC")!
}

private extension ISO8601DateFormatter {

    convenience init(timeZone: TimeZone, formatOptions: ISO8601DateFormatter.Options) {
        self.init()
        self.timeZone = timeZone
        self.formatOptions = formatOptions
    }

    convenience init(formatOptions: ISO8601DateFormatter.Options) {
        self.init()
        self.formatOptions = formatOptions
    }
}

public extension ISO8601DateFormatter {

    static var dateFormatter = ISO8601DateFormatter(timeZone: .utc, formatOptions: [.withFullDate,
                                                                                    .withFullTime,
                                                                                    .withTimeZone,
                                                                                    .withDashSeparatorInDate,
                                                                                    .withColonSeparatorInTime,
    ])

    static let dateNoTimeZoneFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()

    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

public extension DateFormatter {

    static func shortTimeFormatter(with timeZoneId: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: timeZoneId)
        formatter.timeStyle = .short
        return formatter
    }
}
