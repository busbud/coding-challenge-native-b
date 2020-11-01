//
//  Location.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct Location: SearchItemProtocol {
    private var name: String
    private var code: String
    
    init(name: String, code: String) {
        self.name = name
        self.code = code
    }
    
    var value: String {
        get {
            return name
        }
    }
    
    var geohash: String {
        return code
    }
}

// Dummie objects, locations should be pulled from API, this is only for testing proposes
extension Location {
    static let leavingFrom = Location(name: "Quebec", code: "f2m673")
    static let goingTo = Location(name: "Montreal", code: "f25dvk")
}
