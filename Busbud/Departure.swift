//
//  Departure.swift
//  Busbud
//
//  Created by Camille Kander on 2/12/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import Foundation
import SwiftyJSON

class Departure: NSObject {
    
    let ID: String
    let origin: Location
    let destination: Location
    let price: Int
    let departureTime: NSDate
    let arrivalTime: NSDate
    
    init(ID: String, origin: Location, destination: Location, price: Int, departureTime: NSDate, arrivalTime: NSDate) {
        
        self.ID = ID
        self.origin = origin
        self.destination = destination
        self.price = price
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
    }
    
    convenience init(json: JSON, locations: [Location]) throws {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        guard let ID = json["id"].string,
            let originLocationID = json["origin_location_id"].int,
            let destinationLocationID = json["destination_location_id"].int,
            let price = json["prices"]["total"].int,
            let departureTimeString = json["departure_time"].string,
            let arrivalTimeString = json["arrival_time"].string else {
                throw BusbudError.errorWithCode(.MissingResponseItems, failureReason: "Missing items in Departure init.")
        }
        
        let origins = locations.filter { (loc) -> Bool in
            return loc.ID == originLocationID
        }
        guard let origin = origins.first else {
            throw BusbudError.errorWithCode(.InvalidLocationID, failureReason: "Ivalid location ID \(originLocationID)")
        }
        
        let destinations = locations.filter { (loc) -> Bool in
            return loc.ID == destinationLocationID
            }
        guard let destination = destinations.first else {
            throw BusbudError.errorWithCode(.InvalidLocationID, failureReason: "Ivalid location ID \(destinationLocationID)")
        }
        
        guard let departureTime = dateFormatter.dateFromString(departureTimeString) else {
            throw BusbudError.errorWithCode(.InvalidDateString, failureReason: "Invalid date string '\(departureTimeString)'")
        }
        
        guard let arrivalTime = dateFormatter.dateFromString(arrivalTimeString) else {
            throw BusbudError.errorWithCode(.InvalidDateString, failureReason: "Invalid date string '\(arrivalTimeString)'")
        }
        
        self.init(ID: ID, origin: origin, destination: destination, price: price, departureTime: departureTime, arrivalTime: arrivalTime)
    }
}
