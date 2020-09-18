//
//  ticketsCellViewModel.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation

// Data that used for each cell to present results
struct DeparturesCellViewModel {
    
    var departureId:String = ""
    var sourceId:Int = 0
    var departureCityName:String = ""
    var arrivalCityName:String = ""
    var operatorId:String = ""
    var date:String = ""
    var price:String = ""
    var hasDiscount:Bool = false
    var departureTime:String = ""
    var arrivalTime:String = ""
    var arrivalDate:String = ""
    var departureTerminal:String = ""
    var arrivalTerminal:String = ""
    var busCompanyName:String = ""
    var seatsAvailable:Int = 0
    var durationTime:String = ""
    var isNextDay:Bool = false
    var facilities: AmenitiesModel = AmenitiesModel()
    
    
}
