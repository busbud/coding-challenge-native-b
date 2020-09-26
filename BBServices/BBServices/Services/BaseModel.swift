//
//  BaseModel.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This model class was designed and implemented for base of any request, response model base class common things.
 */
public class BaseModel: NSObject {
    
    /**
     * This property hold the value of taskId.
     */
    private var taskId:Int?

    /**
     * This property hold the value of taskId.
     */
    private var taskHandler:((_ taskId:Int?) -> Void)?
    
    /**
     * @discussion This method cancel current request.
     */
    public func cancelRequest() {
        
        if let handler = self.taskHandler {
            
            handler(self.taskId!)
        }
    }
}

internal extension BaseModel {
    
    /**
     * @discussion setTaskId method set task id.
     *
     * @param taskId Int value
     */
    
    func setTaskId(_ taskId:Int) {
        
        self.taskId = taskId
    }
    
    /**
     * @discussion cancelRequestHandler method cancel the current request.
     *
     * @param handler will get taskId
     */
    func cancel(request handler:((_ taskId:Int?) -> Void)!) {
    
        self.taskHandler = handler
    }

    /**
     * @discussion requestParameters method get queries params.
     *
     * @return Dictionary type of object
     */
    @objc func requestParameters() -> Dictionary<String, String> {
        
        return Dictionary()
    }
    
    /**
     * @discussion requestHeaders method get header params.
     *
     * @return Dictionary type of object
     */
    @objc func requestHeaders() -> Dictionary<String, String> {
    
        var headers = Dictionary<String, String>()
        
        headers["Content-Type"] = "application/json"
        headers["Accept"] = kAcceptHeader
        headers["X-Busbud-Token"] = kBusBudToken
        
        return headers
    }
    
    /**
     * @discussion requestBody method get request body params.
     *
     * @return Dictionary type of object
     */
    @objc func requestBody() -> Dictionary<String, Any> {
    
        return Dictionary()
    }
    
    /**
     * @discussion requestPath method get path of url.
     *
     * @return string type of object
     */
    @objc func requestPath() -> String {
        
        return ""
    }
}
