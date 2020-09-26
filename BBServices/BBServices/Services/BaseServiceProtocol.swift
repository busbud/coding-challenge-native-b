//
//  BaseServiceProtocol.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This protocol was designed for common service methods which will implimented by sub class services.
 */
internal protocol BaseServiceProtocol {

    /**
     * This property hold the String object and it's contain url of the service.
     */
    var url:String! {get set}
    
    /**
     * This property hold the any kind of request object.
     */
    var request:AnyObject! {get set}
    
    /**
     * @discussion executeRequest method execute the request to backend and get response or error.
     *
     * @param request This object is any kind of BaseModel object
     *
     * @param callback The completion block will return Response object or ServiceError object.
     */
    func executeRequest(request: AnyObject, callback: @escaping ((_ response: AnyObject?,_ error: ServiceError?) -> Void))
    
    /**
     * @discussion getDefaultHeaders method fetch default headers.
     *
     * @return Dictionary object.
     */
    func getDefaultHeaders() -> Dictionary<String, String>

    /**
     * @discussion getRequest method convert public request object to Request.
     *
     * @return Request object.
     */
    func getRequest() -> Request
    
    /**
     * @discussion isValidResponse method will check error response is valid or not and return error or response.
     *
     * @param response The input value representing the Data object.
     *
     * @param serviceError The input value representing the ServiceError object.
     *
     * @return BOOL value.
     */
    func isValidResponse(response:Data?, errorObject: inout ServiceError?) -> Bool

    /**
     * @discussion getRequestBody method will convert Dictionary object into Data object.
     *
     * @param dictonary The input value representing the Dictionary object.
     *
     * @return Data object.
     */
    func getRequestBody(dictonary: Dictionary<String, Any>!) -> Data?
    
    /**
     * @discussion getResposeObject method will convert Dictionary into public response object.
     *
     * @param data The input value representing the Data object.
     *
     * @return any kind of object.
     */
    @discardableResult func getResposeObject(data: Data!) -> AnyObject?
}
