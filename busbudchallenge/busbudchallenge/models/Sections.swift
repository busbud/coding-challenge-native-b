//
//  Sections.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct Sections {
    var departureInfo: [Location]
    var departureDates: [DepartureDate]
    var passengersInfo: [Passenger]

    var numberOfSections = 3
    
    func numberOfRows() -> Int {
        return departureInfo.count + departureDates.count + passengersInfo.count
    }
    
    func numberOfRows(for section: Int) -> Int {
        switch section {
        case 0:
            return departureInfo.count
        case 1:
            return departureDates.count
        case 2:
            return passengersInfo.count
        default:
            return 0
        }
    }
    
    func getTitle(for row: Int, in section: Int) -> String {
        switch section {
        case 0:
            return row == 0 ? K.Strings.leavingFrom : K.Strings.goingTo
        case 1:
            return row == 0 ? K.Strings.outboundDate : "return"
        case 2:
            return K.Strings.passengers
        default:
            return ""
        }
    }
    
    func getDescription(for row: Int, in section: Int) -> String {
        switch section {
        case 0:
            return departureInfo[row].name
        case 1:
            return departureDates[row].usFormatted
        case 2:
            return passengersInfo[row].info
        default:
            return ""
        }
    }
}

extension Sections {
    static var items: Sections {
        return Sections(departureInfo: [Location.leavingFrom,
                                        Location.goingTo],
                        departureDates: [DepartureDate.eventDate],
                        passengersInfo: [Passenger.passengers])
    }
}
