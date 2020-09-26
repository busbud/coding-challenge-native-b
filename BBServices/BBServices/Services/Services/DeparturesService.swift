//
//  Departures.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

private let departures = "x-departures/";

/**
 * This class was designed and implemented for bus departures list service.
 */
class DeparturesService: BaseService {
        
    internal override init(with communicator:Communicator) {
        
        super.init(with: communicator)
        self.url = kStagingUrl + departures
    }
    
    internal override func executeRequest(request: AnyObject, callback: @escaping ((AnyObject?, ServiceError?) -> Void)) {
        
        self.request  = request
        super.executeRequest(request: request, callback: callback)
    }
    
    internal override func getRequest() -> Request {
        
        let baseRequest = self.request as! DeparturesRequest
        
        let request = Request()
        request.url = self.url
        request.path = baseRequest.requestPath()
        request.requestBody = self.getRequestBody(dictonary: baseRequest.requestBody())
        request.requestMethodType = RequestMethodType.get
        request.requestHeaders = baseRequest.requestHeaders()
        request.queriesParams = baseRequest.requestParameters()
        
        return request
    }
    
    internal override func getResposeObject(data: Data!) -> AnyObject? {
        
        super.getResposeObject(data: data)
        do {
            let decoder = JSONDecoder()
            let info = try decoder.decode(DeparturesResponse.self, from: data)
            return info as AnyObject
        } catch {
            return Utilities.somthingWentWrong()
        }
    }
}
