//
//  Operator.swift
//  Busbud
//
//  Created by Camille Kander on 2/12/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import Foundation
import SwiftyJSON

class Operator: NSObject {
    
    let ID: String
    let name: String
    
    init(ID: String, name: String) {
        
        self.ID = ID
        self.name = name
    }
    
    convenience init(json: JSON) throws {
        
        guard let ID = json["id"].string,
            let name = json["name"].string else {
                throw BusbudError.errorWithCode(.MissingResponseItems, failureReason: "Missing items in Operator init.")
        }
        
        self.init(ID: ID, name: name)
    }
}
