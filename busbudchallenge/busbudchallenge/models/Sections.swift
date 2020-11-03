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
    var passengers: [Passenger]

    var numberOfSections = 3
    
    func numberOfRows() -> Int {
        return departureInfo.count + departureDates.count + passengers.count
    }
    
    func numberOfRows(for section: Int) -> Int {
        switch section {
        case 0:
            return departureInfo.count
        case 1:
            return departureDates.count
        case 2:
            return passengers.count
        default:
            return 0
        }
    }
    
    func getTitle(for row: Int, in section: Int) -> String {
        switch section {
        case 0:
            return row == 0 ? K.Strings.leavingFrom : K.Strings.goingTo
        case 1:
            return row == 0 ? K.Strings.outboundDate : K.Strings.returnDate
        case 2:
            return K.Strings.passengers
        default:
            return ""
        }
    }
    
    func getDescription(for row: Int, in section: Int) -> String {
        switch section {
        case 0:
            return departureInfo[row].displayName
        case 1:
            return departureDates[row].usFormatted
        case 2:
            return passengers[row].info
        default:
            return ""
        }
    }
}
