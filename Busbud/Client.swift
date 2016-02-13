//
//  Client.swift
//  Busbud
//
//  Created by Camille Kander on 2/12/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private let baseURL = NSURL(string: "https://napi.busbud.com/")!
private let headers = ["Accept": "application/json"]
//private let headers = ["Accept": "application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/"]

public class Client: NSObject {
    
    static var dateFormatter: NSDateFormatter {
        get {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter
        }
    }
    
    static func searchDepartures(origin origin: String, destination: String, outboundDate: NSDate = NSDate(), adults: Int, children: Int = 0, seniors: Int = 0, currency: String = "USD", success: (departures: [Departure]) -> (), failure: (error: NSError) -> ()) {
        
        searchDepartures(origin: origin, destination: destination, outboundDate: outboundDate, adults: adults, children: children, seniors: seniors, currency: currency, poll: false, locationsJSON: [], departuresJSON: [], success: success, failure: failure)
    }
    
    private static func searchDepartures(origin origin: String, destination: String, outboundDate: NSDate, adults: Int, children: Int, seniors: Int, currency: String, poll: Bool, var locationsJSON: [JSON], var departuresJSON :[JSON], success: (departures: [Departure]) -> (), failure: (error: NSError) -> ()) {
        
        let URL = NSURL(string: "x-departures/\(origin)/\(destination)/\(dateFormatter.stringFromDate(outboundDate))\(poll ? "/poll" : "")", relativeToURL: baseURL)!
        
        let parameters: [String: AnyObject] = ["adult": adults, "child": children, "senior": seniors, "currency": currency]
        
        Alamofire.request(.GET, URL, parameters: parameters, headers: headers).validate().responseJSON { (response) -> Void in
            
            guard response.result.isSuccess else {
                failure(error: response.result.error!)
                return
            }
            
            guard let value = response.result.value else {
                failure(error: BusbudError.errorWithCode(.ParsingError, failureReason: "Couldn't parse server response."))
                return
            }
            
            let json = JSON(value)
            
            print(json)
            
            if let locations = json["locations"].array {
                for location in locations {
                    locationsJSON.append(location)
                }
            }
            
            if let departures = json["departures"].array {
                for departure in departures {
                    departuresJSON.append(departure)
                }
            }
            
            guard let complete = json["complete"].bool else {
                return
            }
            
            if complete == true {
                
                var locations: [Location] = []
                for locationJSON in locationsJSON {
                    do {
                        locations.append(try Location(json: locationJSON))
                    } catch {
                        print(error as NSError)
                    }
                }
                
                var departures: [Departure] = []
                for departureJSON in departuresJSON {
                    do {
                        departures.append(try Departure(json: departureJSON, locations: locations))
                    } catch {
                        print(error as NSError)
                    }
                }
                
                departures.sortInPlace({ (d1, d2) -> Bool in
                    return d1.departureTime < d2.departureTime
                })
                
                success(departures: departures)
            } else {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * Int64(NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
                    Client.searchDepartures(origin: origin, destination: destination, outboundDate: outboundDate, adults: adults, children: children, seniors: seniors, currency: currency, poll: true, locationsJSON: locationsJSON, departuresJSON: departuresJSON, success: success, failure: failure)
                })
            }
        }
    }
}
