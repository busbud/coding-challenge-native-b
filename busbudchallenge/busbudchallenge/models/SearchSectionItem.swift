//
//  SearchSectionItem.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

protocol SearchItemProtocol {
    var value: String { get }
}

struct SearchSectionItem {
    var name: String
    var value: SearchItemProtocol?
}

// Dummie objects, locations should be pulled from API, this is only for testing proposes
extension SearchSectionItem {
    static var departure = [SearchSectionItem(name: K.Strings.leavingFrom, value: Location.leavingFrom),
                            SearchSectionItem(name: K.Strings.goingTo, value: Location.goingTo)]
    
    static var dates = [SearchSectionItem(name: K.Strings.outboundDate, value: DepartureDate.eventDate)]
    
    static var passengers = [SearchSectionItem(name: K.Strings.passengerCount, value: Passenger.passengers)]
}
