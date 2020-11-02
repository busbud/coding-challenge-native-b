//
//  NetworkErrorWrongConfig.swift
//  Osheaga Routes Swift
//
//  Created by user on 02/11/20.
//

import Foundation

class NetworkErrorWrongConfig: NSError {
    
    init() {
        super.init(domain: "", code: -1, userInfo: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
