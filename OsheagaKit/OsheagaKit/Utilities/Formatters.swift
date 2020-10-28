//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public extension TimeZone {

    static var utc = TimeZone(abbreviation: "UTC")!
}

public extension ISO8601DateFormatter.Options {

    static var JSONDateFormatterOptions: ISO8601DateFormatter.Options = [
        .withFullDate,
        .withFullTime,
        .withTimeZone,
        .withDashSeparatorInDate,
        .withColonSeparatorInTime,
        .withFractionalSeconds
    ]

    static var JSONDateOnlyFormatterOptions: ISO8601DateFormatter.Options = [
        .withYear,
        .withMonth,
        .withDay,
        .withDashSeparatorInDate,
    ]
}

private extension ISO8601DateFormatter {

    convenience init(timeZone: TimeZone, formatOptions: ISO8601DateFormatter.Options) {
        self.init()
        self.timeZone = timeZone
        self.formatOptions = formatOptions
    }
}

public extension ISO8601DateFormatter {

    static var JSONDateFormatter = ISO8601DateFormatter(timeZone: .utc, formatOptions: .JSONDateFormatterOptions)
    static var JSONDateOnlyFormatter = ISO8601DateFormatter(timeZone: .utc, formatOptions: .JSONDateOnlyFormatterOptions)
}

extension DateFormatter {

    public static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
