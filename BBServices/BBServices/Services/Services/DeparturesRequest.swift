//
//  DeparturesRequest.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This class was designed and implemented for login request model.
 */
public class DeparturesRequest: BaseModel {
    
    public private(set) var origin:String
    public private(set) var destination:String
    public private(set) var on:Date
    public private(set) var adult:Int
    public private(set) var child:Int
    public private(set) var senior:Int
    public private(set) var lang:Language
    public private(set) var currency:Currency

    internal enum RequestKey: String {
        
        case origin
        case destination
        case on
        case adult
        case child
        case senior
        case lang
        case currency
    }
    
    public init(origin:String,
                destination:String,
                on: Date,
                adult:Int=0,
                child:Int=0,
                senior:Int=0,
                lang:Language,
                currency:Currency
    ) {
        
        self.origin = origin
        self.destination = destination
        self.on = on
        self.adult = adult
        self.child = child
        self.senior = senior
        self.lang = lang
        self.currency = currency
    }
    
    internal override func requestBody() -> Dictionary<String, Any> {
        
        let requestBody = super.requestBody()
        return requestBody;
    }
    
    internal override func requestHeaders() -> Dictionary<String, String> {
        
        let requestHeaders = super.requestHeaders()
        return requestHeaders
    }
    
    internal override func requestParameters() -> Dictionary<String, String> {
        
        var requestParams = super.requestParameters()
        
        requestParams[RequestKey.adult.rawValue] = String(self.adult)
        requestParams[RequestKey.child.rawValue] = String(self.child)
        requestParams[RequestKey.senior.rawValue] = String(self.senior)
        requestParams[RequestKey.lang.rawValue] = self.lang.alpha2.uppercased()
        requestParams[RequestKey.currency.rawValue] = self.currency.code

        return requestParams
    }
    
    internal override func requestPath() -> String {
        
        let path = super.requestPath()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return path + self.origin + "/" + self.destination + "/" + formatter.string(from: self.on)
    }
}
