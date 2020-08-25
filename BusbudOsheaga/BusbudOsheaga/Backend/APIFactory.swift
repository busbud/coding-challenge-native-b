//
//  APIFactory.swift
//
//  Created by Rafael Moraes on 17/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation

struct APIFactory {
    static func api(for service: Service) -> API {
        switch service {
        case is BusbudService:
            return BusbudAPI()
        default:
            return BusbudAPI()
        }
    }
}
