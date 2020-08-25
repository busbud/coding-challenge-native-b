//
//  ServiceFactory.swift
//
//  Created by Rafael Moraes on 17/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation

enum AvailableService {
    case search
}

struct ServiceFactory {
    static func service(_ available: AvailableService) -> Service {
        switch available {
        case .search:
            return SearchService()
        }
    }
}
