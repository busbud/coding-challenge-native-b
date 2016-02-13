//
//  City.swift
//  Busbud
//
//  Created by Camille Kander on 2/12/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import Foundation
import SwiftyJSON

class City: NSObject {
    
    let ID: String
    let geohash: String
    let latitude: Double
    let longitude: Double
    let name: String
    
    init(ID: String, geohash: String, latitude: Double, longitude: Double, name: String) {
        
        self.ID = ID
        self.geohash = geohash
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
    }
    
    convenience init(json: JSON) throws {
        
        guard let ID = json["id"].string,
            let geohash = json["geohash"].string,
            let latitude = json["latitude"].double,
            let longitude = json["longitude"].double,
            let name = json["name"].string else {
                throw BusbudError.errorWithCode(.MissingResponseItems, failureReason: "Missing items in City init.")
        }
        
        self.init(ID: ID, geohash: geohash, latitude: latitude, longitude: longitude, name: name)
    }
}
