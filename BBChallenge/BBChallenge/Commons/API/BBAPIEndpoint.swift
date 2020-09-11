//
//  BBAPIEndpoint.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import Foundation

enum BBAPIEndpoint: String {
    case departures = "x-departures"
}

extension BBAPIEndpoint: Endpoint {
    
    static let scheme = "https"
    static let host = "napi.busbud.com"
    static let acceptHeader = """
        application/vnd.busbud+json;
        version=2;
        profile=https://schema.busbud.com/v2/
    """
    
    var path: String { self.rawValue }

    var base: String {
        "\(BBAPIEndpoint.scheme)://\(BBAPIEndpoint.host)/\(self.path)"
    }
    
    var headers: [String : String]? {
        ["Accept":"\(BBAPIEndpoint.acceptHeader)",
            "X-Busbud-Token":"\(XBusbudTokenAPIKey)"]
    }
    
}
