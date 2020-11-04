//
//  Helper.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import Foundation

func delay(durationInSeconds: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + durationInSeconds, execute: completion)
}

func mainQueue(completion: @escaping () -> Void) {
    DispatchQueue.main.async(execute: completion)
}

// Dummie objects, these should be loaded from API, but no endpoint
// was provided for it so just mocking the items
extension Sections {
    static var items: Sections {
        return Sections(departureInfo: [Location.leavingFrom,
                                        Location.goingTo],
                        departureDates: [DepartureDate.eventDate],
                        passengers: [Passenger.passengers])
    }
}

extension Location {
    static var leavingFrom: Location {
        var loc = Location()
        loc.name = "Quebec"
        loc.geohash = "f2m673"
        return loc
    }
    static var goingTo: Location {
        var loc = Location()
        loc.name = "Montreal"
        loc.geohash = "f25dvk"
        return loc
    }
}

extension DepartureDate {
    static var eventDate = DepartureDate(date: Date.from(string: "2021-07-29"))
}

extension Passenger {
    static var passengers = Passenger(type: .adult, count: 1)
}
