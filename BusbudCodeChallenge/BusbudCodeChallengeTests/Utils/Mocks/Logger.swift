//
//  Logger.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
@testable import BusbudCodeChallenge

class MockLogger: Logging {
    // Stores captured log messages for verification in tests
    private(set) static var loggedMessages: [String] = []
    
    static func log(_ message: String, _ function: String, _ file: String, _ line: Int) {
        let fileName = URL(fileURLWithPath: file).lastPathComponent
        let formattedMessage = "[\(fileName):\(line)] \(function) - \(message)"
        loggedMessages.append(formattedMessage)
    }
    
    // Utility function to clear logged messages between tests
    static func reset() {
        loggedMessages.removeAll()
    }
}
