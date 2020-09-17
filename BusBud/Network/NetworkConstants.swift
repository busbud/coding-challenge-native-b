//
//  NetworkConstants.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation

struct serverAddress {
    static var baseApiURL:String {
        get {
            return "https://napi.busbud.com/"
        }
        
    }
}

enum HTTPHeaderField: String {
    case acceptType = "Accept"
    case busbudToken = "X-Busbud-Token"
}


enum ContentHeaderValue: String {
    case accept = "application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/"
    case x_busbud_token = "PARTNER_BaASYYHxTxuOINEOMWq5GA"
}
