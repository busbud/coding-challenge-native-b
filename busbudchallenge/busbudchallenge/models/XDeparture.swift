//
//  XDeparture.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct XDeparture: Codable {
    var id: String?
    var operatorID: String?
    var originLocationID: Int?
    var destinationLocationID: Int?
    var className: String?
    var availableSeats: Int?
    var prices: Price?
    var departureTimezone: String?
    var arrivalTimezone: String?
    var departureDateTime: String?
    var arrivalDateTime: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case operatorID = "operator_id"
        case originLocationID = "origin_location_id"
        case destinationLocationID = "destination_location_id"
        case className = "class_name"
        case availableSeats = "available_seats"
        case prices
        case departureTimezone = "departure_timezone"
        case arrivalTimezone = "arrival_timezone"
        case departureDateTime = "departure_time"
        case arrivalDateTime = "arrival_time"
    }
    
    var operators: [Operator]?
    var cities: [City]?
    var locations: [Location]?
}

extension XDeparture: ResultViewItem {
    var operatorLogo: String {
        operatorInfo.logo?
            .replacingOccurrences(of: "{", with: "%7B")
            .replacingOccurrences(of: "}", with: "&7D") ?? ""
    }
    
    var operatorName: String {
        operatorInfo.name ?? ""
    }
    
    var departureTime: String {
        return Date
            .from(string: departureDateTime ?? "", with: .iso8061)
            .toString(with: .iso8061Time)
    }
    
    var departureLocation: String {
        originLocationInfo.name ?? ""
    }
    
    var arrivalTime: String {
        return Date
            .from(string: arrivalDateTime ?? "", with: .iso8061)
            .toString(with: .iso8061Time)
    }
    
    var arrivalLocation: String {
        destinationLocationInfo.name ?? ""
    }
    
    var ticketPrice: String {
        return ((prices?.total ?? 0)/100).description
    }
    
    var currencySymbol: String {
        return prices?.currency ?? ""
    }
}

private extension XDeparture {
    
    var operatorInfo: Operator {
        guard let operators = operators else { return Operator() }
        return operators.filter { $0.id == operatorID }.first ?? Operator()
    }
    
    var originLocationInfo: Location {
        guard let locations = locations else { return Location() }
        return locations.filter { $0.id == originLocationID }.first ?? Location()
    }
    
    var destinationLocationInfo: Location {
        guard let locations = locations else { return Location() }
        return locations.filter { $0.id == destinationLocationID }.first ?? Location()
    }
    
}

struct Price: Codable {
    var total: Int?
    var breakdown: [String: Int]?
    var discounted: Bool?
    var currency: String?
}
