//
//  DepartureRowViewModel.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import Foundation
import SwiftUI

/**
 Departures row view model.
 Defines the departures cell model ,
 Holds the state of the locationOrigin, locationDestination, departure, and providerOperator
 Formats data to display.
*/
struct DepartureRowViewModel: Identifiable {
    /// Store the origin location
    private let locationOrigin: Location?
    /// Store the final destination location
    private let locationDestination: Location?
    /// Store the departure detail
    private let departure: Departure
    /// Store the operator detail
    private let providerOperator: Operator?

    /// Generic id
    let id = UUID()
    
    /// Format departure time
    var departureTime: String {
        "Departure:\n \(displayDateFormatter.string(from: departure.departureTime))"
    }

    /// Format arrival time
    var arrivalTime: String {
        "Arrival:\n \(displayDateFormatter.string(from: departure.arrivalTime))"
    }
    
    /// Format departure address
    var locationDepartureAddress: String {
        guard let origin = locationOrigin else { return "" }
        return origin.address.joined(separator: ", ")
    }
    
    /// Format arrival address
    var locationArrivalAddress: String {
        guard let destination = locationDestination else { return "" }
        return destination.address.joined(separator: ", ")
    }
    
    /// Format price
    var price: String {
        return String(departure.prices.total)
    }
    
    init(locationOrigin: Location? = nil,
         locationDestination: Location? = nil,
         departure: Departure,
         providerOperator: Operator? = nil) {
        self.locationOrigin = locationOrigin
        self.locationDestination = locationDestination
        self.departure = departure
        self.providerOperator = providerOperator
    }
}

extension DepartureRowViewModel: Hashable {
    static func == (lhs: DepartureRowViewModel, rhs: DepartureRowViewModel) -> Bool {
        return ("\(lhs.departureTime + lhs.arrivalTime + String(lhs.locationOrigin?.id ?? 0) + String(lhs.locationOrigin?.id ?? 0))")
            == ("\(rhs.departureTime + rhs.arrivalTime + String(rhs.locationDestination?.id ?? 0) + String(rhs.locationDestination?.id ?? 0))")
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.departureTime)
        hasher.combine(self.arrivalTime)
        hasher.combine(self.locationOrigin?.id ?? 0)
        hasher.combine(self.locationDestination?.id ?? 0)
    }
}
