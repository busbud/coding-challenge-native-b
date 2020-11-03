//
//  DepartureDate.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct DepartureDate {
    private var date: Date
    
    init(date: Date) {
        self.date = date
    }
    
    var usFormatted: String {
        return date.toString(with: .usStyle)
    }
    
    var isoFormatted: String {
        return date.toString(with: .iso8061Date)
    }
}

// Dummie objects, locations should be pulled from API, this is only for testing proposes
extension DepartureDate {
    static var eventDate = DepartureDate(date: Date.from(string: "2020-11-12"))
}
