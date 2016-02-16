//
//  Currency.swift
//  Busbud
//
//  Created by Camille Kander on 2/16/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import UIKit

enum Currency: String {
    
    case CAD
    case EUR
    case GBP
    case USD
    
    var symbol: String {
        switch self {
        case .CAD, .USD: return "$"
        case .EUR: return "€"
        case .GBP: return "£"
        }
    }
}
