//
//  DepartureTableCellVM.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import UIKit

struct DepartureTableCellVM {
    var priceTitle: String
    var departureTimeTitle: String
    var departureCityTitle: String
    var arrivalTimeTitle: String
    var arrivalCityTitle: String
    var locationNameTitle: String
    
    init(departure: XDeparture, originCity: City, destCity: City, location: Location) {
        self.priceTitle = "$\(departure.price.total)"
        self.departureTimeTitle = DepartureTableCellVM.dateFormatter.string(from: departure.departureTime)
        self.departureCityTitle = originCity.name
        self.arrivalTimeTitle = DepartureTableCellVM.dateFormatter.string(from: departure.arrivalTime)
        self.arrivalCityTitle = destCity.name
        self.locationNameTitle = location.name
    }
}

extension DepartureTableCellVM {
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "HH:mm a"
        return df
    }()
}
