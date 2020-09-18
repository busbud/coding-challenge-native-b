//
//  SearchModel.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation


//Model that is using to creating search parameters

struct SearchModel {
    var departureGeoHash:String = ""
    var departureName:String = ""
    var arrivalGeoHash:String = ""
    var arrivalName:String = ""
    var adult:String = "1"
    var date:String = ""
    var child:String = ""
    var senior:String = ""
    var lang:String = ""
    var currency:String = ""
}
