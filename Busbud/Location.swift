//
//  Location.swift
//  Busbud
//
//  Created by Camille Kander on 2/12/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import Foundation
import SwiftyJSON

class Location: NSObject {
    
    let ID: Int
    let name: String
    
    init(ID: Int, name: String) {
        
        self.ID = ID
        self.name = name
    }
    
    convenience init(json: JSON) throws {
        
        guard let ID = json["id"].int,
            let name = json["name"].string else {
                throw BusbudError.errorWithCode(.MissingResponseItems, failureReason: "Missing items in Location init.")
        }
        
        self.init(ID: ID, name: name)
    }
}
