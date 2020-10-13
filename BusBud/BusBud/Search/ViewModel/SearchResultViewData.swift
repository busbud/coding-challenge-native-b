//
//  SearchResultViewData.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-09.
//

import Foundation

struct SearchResultViewData {
    var departureTime: String
    var arrivalTime: String
    var locationName: String
    var price: String

    init(departureTime: String,
         arrivalTime: String,
         locationName: String,
         price: String) {
        self.price = price
        self.departureTime = departureTime
        self.locationName = locationName
        self.arrivalTime = arrivalTime
    }
}
