//
//  Errors.swift
//  Busbud
//
//  Created by Camille Kander on 2/12/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import Foundation

public struct BusbudError {
    
    public static let Domain = "com.xzoky.Busbud.error"
    
    public enum Code: Int {
        case ParsingError = 6000
        case MissingResponseItems = 6001
        case InvalidLocationID = 6002
        case InvalidDateString = 6003
    }
    
    static func errorWithCode(code: Code, failureReason: String) -> NSError {
        return errorWithCode(code.rawValue, failureReason: failureReason)
    }
    
    static func errorWithCode(code: Int, failureReason: String) -> NSError {
        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
        return NSError(domain: Domain, code: code, userInfo: userInfo)
    }
}