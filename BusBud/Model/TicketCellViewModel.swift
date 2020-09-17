//
//  ticketsCellViewModel.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation

struct TicketCellViewModel {
    
    var date:String = ""
    var price:String = ""
    var departureTime:String = ""
    var arrivalTime:String = ""
    var departureTerminal:String = ""
    var arrivalTerminal:String = ""
    var busCompanyName:String = ""
    var seatsAvailable:Int = 0
    var facilities:[String] = []
    
}
