//
//  SearchItems.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct SearchSection {
    var key: String
    var value: [SearchSectionItem]
    
    static let sections: [SearchSection] = [
        SearchSection(key: "Departure",
                      value: [SearchSectionItem(name: "Leaving from",
                                                value: DepartureLocations(name: "Quebec",
                                                                          code: "f2m673")),
                              SearchSectionItem(name: "Going to",
                                                value: DepartureLocations(name: "Montreal",
                                                                          code: "f25dvk"))]),
        SearchSection(key: "Dates",
                      value: [SearchSectionItem(name: "Departure date",
                                                value: DepartureDates(date: Date.from(string: "2021-07-29")))]),
        SearchSection(key: "Passengers",
                      value: [SearchSectionItem(name: "Number of passengers",
                                                value: DeparturePassangers(type: "Adults"))])
    ]
}

struct SearchSectionItem {
    var name: String
    var value: SearchItemProtocol?
}

protocol SearchItemProtocol {
    var value: String { get }
}

struct DepartureLocations: SearchItemProtocol {
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

struct DepartureDates: SearchItemProtocol {
    private var date: Date
    
    init(date: Date) {
        self.date = date
    }
    
    var value: String {
        return date.toString(with: "MMMM dd',' YYYY")
    }
    
    var isoFormatted: String {
        return date.toString()
    }
}

struct DeparturePassangers: SearchItemProtocol {
    private var type: String
    private var count = 1
    
    init(type: String) {
        self.type = type
    }
    
    var value: String {
        return "\(type) \(count)"
    }
    
    mutating func increment() {
        count += 1
    }
    
    mutating func decrement() {
        guard count > 1 else { return }
        count -= 1
    }
}
