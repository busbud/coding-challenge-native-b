//
//  BaseService.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This class was designed and implemented for intigration of service. it's super class of all services.
 */
internal class BaseService: NSObject, BaseServiceProtocol {
    
    private override init() {}

    internal var url: String!
    
    internal var request: AnyObject!
    
    internal var communicator:Communicator!
    
    internal init(with communicator:Communicator) {
        
        self.communicator = communicator
        self.url = kStagingUrl
    }
    
    internal func executeRequest(request: AnyObject, callback: @escaping ((_ response: AnyObject?,_ error: ServiceError?) -> Void)) {
        
        let requestObject = self.getRequest()
        
        self.communicator.execute(request: requestObject) { (response, commError) in
            
            OperationQueue.main.addOperation({
                
                var serviceError:ServiceError?
                
                if self.isValidResponse(response: response?.responseBody, errorObject: &serviceError) {
                    
                    let responseObject = self.getResposeObject(data: response?.responseBody!)
                    if let responseObject = responseObject as? ServiceError {
                        
                        callback(nil, responseObject)
                    } else {
                        
                        callback(responseObject, nil)
                    }
                } else {
                    
                    callback(nil, serviceError)
                }
            })
        }

        if ((self.request) != nil) {
            
            let baseRequest:BaseModel = self.request as! BaseModel
            baseRequest.setTaskId(requestObject.taskId ?? 0)
            baseRequest.cancel {[unowned self] (taskId) in
                self.communicator.cancel(task: taskId ?? 0)
            }
        }
    }
    
    internal func getDefaultHeaders() -> Dictionary<String, String> {
        
        return ["Content-Type":"application-json"]
    }
    
    internal func getRequest() -> Request {
        
        return Request()
    }
    
    internal func getRequestBody(dictonary: Dictionary<String, Any>!) -> Data? {
        
        do {
            if let object = dictonary {
                
                let data = try JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions.init(rawValue: 0))
                return data
            }
            return nil
        } catch {
            
            return nil
        }
    }
    
    @discardableResult internal func getResposeObject(data: Data!) -> AnyObject? {
        
        return BaseModel()
    }
    
    //TODO: Need to handle error properly
    internal func isValidResponse(response:Data?, errorObject: inout ServiceError?) -> Bool {
                
        if let data = response {
            
            do {
                
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableLeaves)
                
                if jsonObject is Array<Any> {
                    
                    errorObject = Utilities.somthingWentWrong()
                    return false
                } else {
                    
                    let result = jsonObject as? Dictionary<String, AnyObject>
                    guard let res = result else {
                        
                        errorObject = Utilities.somthingWentWrong()
                        return false
                    }
                    
                    let errorObj = res["error"]
                    if errorObj != nil {
                        
                        let error = ServiceError()
                        error.errorCode = errorObj!["code"] as? Int
                        error.errorMessage = errorObj!["details"] as? String
                        errorObject = error
                        return false
                    }
                    return true
                }

            } catch {
                
                errorObject = Utilities.somthingWentWrong()
                return false
            }
        } else {
            
            errorObject = Utilities.somthingWentWrong()
            return false
        }
    }
}
