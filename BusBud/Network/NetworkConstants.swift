//
//  NetworkConstants.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation

struct serverAddress {
    
    
    //MARK: - Base Server URL address
    static var baseApiURL:String {
        get {
            return "https://napi.busbud.com/"
        }
        
    }
}

// MARK: - HTTP headers that defined by busbud
enum HTTPHeaderField: String {
    case acceptType = "Accept"
    case busbudToken = "X-Busbud-Token"
}


// MARK: - Headers Content that defined by Busbud server
enum ContentHeaderValue: String {
    case accept = "application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/"
    case x_busbud_token = "PARTNER_BaASYYHxTxuOINEOMWq5GA"
}
