//
//  Passenger.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

enum PassengerType: String {
    case adults
    case children
    case seniors
}

struct Passenger: SearchItemProtocol {
    private var type: PassengerType
    private var count: Int
    
    init(type: PassengerType, count: Int) {
        self.type = type
        self.count = count
    }
    
    var value: String {
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

// Dummie objects, locations should be pulled from API, this is only for testing proposes
extension Passenger {
    static var passengers = Passenger(type: .adults, count: 1)
}
