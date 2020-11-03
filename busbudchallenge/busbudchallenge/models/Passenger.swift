//
//  Passenger.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

enum PassengerType: String {
    case adult
    case children
    case senior
}

struct Passenger {
    var type: PassengerType
    var count: Int
    
    init(type: PassengerType, count: Int) {
        self.type = type
        self.count = count
    }
    
    var info: String {
        return "\(type.rawValue.localized) \(count)"
    }
    
    mutating func increment() {
        count += 1
    }
    
    mutating func decrement() {
        guard count > 1 else { return }
        count -= 1
    }
}
