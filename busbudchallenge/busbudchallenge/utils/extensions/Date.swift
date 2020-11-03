//
//  UIDate.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

enum DateFormats: String {
    case iso8061 = "yyyy-MM-dd'T'HH:mm:ss"
    case iso8061Date = "yyy-MM-dd"
    case iso8061Time = "HH:mm a"
    case usStyle = "MMMM dd',' YYYY"
}

extension Date {
    func toString(with format: DateFormats = .iso8061) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
    
    static func from(string: String, with format: DateFormats = .iso8061Date) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.date(from: string) ?? Date()
    }
}
