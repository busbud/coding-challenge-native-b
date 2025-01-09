//
//  Logger.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

import Foundation

protocol Logging {
    static func log(_ message: String, _ function: String, _ file: String, _ line: Int)
}

extension Logging {
    static func log(_ message: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line) {
        Self.log(message, function, file, line)
    }
}

struct Logger: Logging {
    static func log(_ message: String, _ function: String, _ file: String, _ line: Int) {
        let fileName = URL(fileURLWithPath: file).lastPathComponent
#if DEBUG
        print("[\(fileName):\(line)] \(function) - \(message)")
#endif
    }
}
