//
//  Service.swift
//
//  Created by Rafael Moraes on 17/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation

protocol Service {
    var serviceAPI: API { get }
}

protocol BusbudService: Service {
    var api: BusbudAPI { get }
}
