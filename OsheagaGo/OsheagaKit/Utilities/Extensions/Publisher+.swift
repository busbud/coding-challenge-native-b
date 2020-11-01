//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation
import Combine
import os.log

public extension Publisher {
    func logEvents(using log: OSLog, printOutput: Bool = false) -> Publishers.HandleEvents<Self> {
        handleEvents(receiveOutput: { output in
            if printOutput {
                os_log("Publisher %{private}@ received output: %{private}@", log: log, type: .default, String(describing: self), String(describing: output))
            } else {
                os_log("Publisher %{private}@ received output", log: log, type: .default, String(describing: self))
            }
        }, receiveCompletion: { completion in
            switch completion {
            case .finished:
                os_log("Publisher %{private}@ finished", log: log, type: .default, String(describing: self))
            case .failure(let error):
                os_log("Publisher %{private}@ failed with error: %{private}@", log: log, type: .fault, String(describing: self), String(describing: error))
            }
        }, receiveCancel: {
            os_log("Publisher %{private}@ cancelled", log: log, type: .default, String(describing: self))
        }, receiveRequest: { demand in
            os_log("Publisher %{private}@ received request with %{private}@ demand", log: log, type: .default, String(describing: self), String(describing: demand))
        })
    }
}

extension Int64: SchedulerTimeIntervalConvertible {
    public static func seconds(_ s: Int) -> Int64 {
        return Int64(s * 1000000000)
    }

    public static func seconds(_ s: Double) -> Int64 {
        return Int64(s * 1000000000)
    }

    public static func milliseconds(_ ms: Int) -> Int64 {
        return Int64(ms * 1000000)
    }

    public static func microseconds(_ us: Int) -> Int64 {
        return Int64(us * 1000)
    }

    public static func nanoseconds(_ ns: Int) -> Int64 {
        return Int64(ns)
    }
}

extension DispatchTime: Strideable {
    public func distance(to other: DispatchTime) -> Int64 {
        return Int64(rawValue) - Int64(other.rawValue)
    }

    public func advanced(by n: Int64) -> DispatchTime {
        return DispatchTime(uptimeNanoseconds: UInt64(Int64(rawValue) + n))
    }

    public typealias Stride = Int64
}
