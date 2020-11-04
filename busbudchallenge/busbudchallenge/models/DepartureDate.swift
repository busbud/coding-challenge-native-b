//
//  DepartureDate.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

enum DateType {
    case departure
    case `return`
}

struct DepartureDate {
    var date: Date
    let type: DateType
    
    init(date: Date, type: DateType = .departure) {
        self.date = date
        self.type = type
    }
    
    var usFormatted: String {
        return date.toString(with: .usStyle)
    }
    
    var isoFormatted: String {
        return date.toString(with: .iso8061Date)
    }
}
