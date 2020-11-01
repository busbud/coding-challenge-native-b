//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public enum OsheagaError: Error {
    case noData
    case unableToDecodeDate(String)
    case url(URLError)
    case other(Error)
}

extension OsheagaError {

    public init(other: Error) {
        switch other {
        case let error as URLError:
            self = .url(error)
        case let error as OsheagaError:
            self = error
        default:
            self = .other(other)
        }
    }
}
