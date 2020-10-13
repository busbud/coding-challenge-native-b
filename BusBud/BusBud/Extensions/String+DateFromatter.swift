//
//  String+DateFromatter.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import Foundation

extension String {
    var formatedDate: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = formatter.date(from: self) else { return nil }
        formatter.dateFormat = "dd MMM yyyy hh:mm a"
        return formatter.string(from: date)
    }
}
