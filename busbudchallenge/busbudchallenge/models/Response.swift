//
//  Result.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct Response: Codable {
    var originCityId: String?
    var destinationCityId: String?
    var cities: [City]?
    var locations: [Location]?
    var operators: [Operator]?
    var departures: [XDeparture]?
    var complete: Bool?
    var ttl: Int?
    var isValidRoute: Bool?
    
    enum CodingKeys: String, CodingKey {
        case originCityId = "origin_city_id"
        case destinationCityId = "destination_city_id"
        case cities
        case locations
        case operators
        case departures
        case complete
        case ttl
        case isValidRoute = "is_valid_route"
    }
}

extension Response: ResultViewItem {
    func departureTime(forItemAt index: Int) -> String {
        return departures?[index].departureTime ?? ""
    }
    
    func arrivalTime(forItemAt index: Int) -> String {
        return departures?[index].arrivalTime ?? ""
    }
    
    func locationName(forItemAt index: Int) -> String {
        let locationId = departures?[index].originLocationID
        return locations?.filter{ $0.id == locationId }.first?.name ?? ""
    }
    
    func ticketPrice(forItemAt index: Int) -> String {
        return departures?[index].prices?.total?.description ?? ""
    }
}
