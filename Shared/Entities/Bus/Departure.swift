//
//  Departure.swift
//  Osheaga Routes
//
//  Created by user on 01/11/20.
//

import Foundation

struct Departure: Codable {
    
    struct Prices: Codable {
        var total: Int
        var discounted: Bool?
    }
    
    var id: String?
    var sourceId: Int?
    
    var checkoutType: String?
    var operatorId: String?
    var originLocationId: Int?
    var destinationLocationId: Int?
    var class_: String?
    var className: String?
    
//         "amenities": {
//           "display_name": "Economy",
//           "wifi": true,
//           "toilet": true,
//           "ac": true,
//           "food": false,
//           "refreshment": false,
//           "power_outlets": true,
//           "tv": false,
//           "bus_attendant": false,
//           "leg_room": false
//         },
    
    var prices: Prices
    
    var availableSeats: Int?
    var departureTimezone: String?
    var arrivalTimezone: String?
    var departureTime: String?
    var arrivalTime: String?
    
    var departureArrivalReadable: String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        guard let departureTime = formatter.date(from: self.departureTime ?? "") else { return ""}
        guard let arrivalTime = formatter.date(from: self.arrivalTime ?? "") else { return ""}
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "hh:mm a"
        
        return dateFormatter.string(from: departureTime) + " - " + dateFormatter.string(from: arrivalTime)
        
    }
}
