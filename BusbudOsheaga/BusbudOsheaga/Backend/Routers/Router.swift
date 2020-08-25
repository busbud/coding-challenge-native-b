//
//  Router.swift
//
//  Created by Rafael Moraes on 15/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation
import Alamofire

protocol Router {
    
    var httpMethod: HTTPMethod { get }
    var baseUrl: String { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    
}
