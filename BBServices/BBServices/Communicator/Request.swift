//
//  Request.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This enum is use for request type.
 */
internal enum RequestMethodType:String {
    
    /**
     * get.
     */
    case get
    /**
     * post.
     */
    case post
    /**
     * put.
     */
    case put
    /**
     * delete.
     */
    case delete
    /**
     * head.
     */
    case head
}

/**
 * This model use as request for communicator.
 */
internal class Request:NSObject {

    /**
     * This property hold the value of taskId.
     */
    internal var taskId:Int?

    /**
     * This property hold the value of url.
     */
    internal var url:String!
    
    /**
     * This property hold the value of url.
     */
    internal var path:String?

    /**
     * This property hold the value of queries parameters.
     */
    internal var queriesParams:Dictionary<String, Any>?

    /**
     * This property hold the value of request header parameters.
     */
    internal var requestHeaders:Dictionary<String, String>?

    /**
     * This property hold the value of request method type.
     */
    internal var requestMethodType:RequestMethodType!

    /**
     * This property hold the value of request body.
     */
    internal var requestBody:Data?

    /**
     * This property hold the value of is mock data.
     */
    internal var isMockData:Bool = false
    
    /**
     * This property hold the value of CommError object.
     */
    internal var mockError:CommError?
    
    /**
     * This property hold the value of Response object.
     */
    internal var mockResponse:Response?
}
