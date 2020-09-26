//
//  BBServices.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This enum is for state of sdk initlization.
 */
public enum InitalizeState:String {
    
    /**
     * SDK started initization.
     */
    case started

    /**
     * SDK completed initization.
     */
    case completed

    /**
     * SDK initization state is in prograss.
     */
    case prograss
}

/**
 * This class was designed and implemented to help people to get services. This class design using facade pattens.
 */
public class Services: NSObject {

    /**
     * @discussion forceUpdateHandler is closure and user for handle force update app.
     */
    internal var forceUpdateHandler: ((_ isForceUpdate:Bool) -> Void)?

    /**
     * @discussion forceUpdateHandler is closure and user for handle force update app.
     */
    internal var sessionTimeoutHandler: ((_ isSessionTimeout:Bool) -> Void)?

    /**
     * Singleton object of Services class.
     */
    public static let shared = Services()

    /**
     * private init method.
     */
    private override init() {}
    
    /**
     * @discussion It initalize the service framework and then you can do rest of operations. This method accepts a Configuration object representing the configuration and completion block that contain InitalizeState state and ServiceError error object.
     *
     * @param configuration The input value representing the Configuration object.
     *
     * @param completionBlock The completion block will return InitalizeState or ServiceError object. This will helps for framework initization is done or not
     */
    public func initSDK(with configuration:Configuration!, completionHandler: ((_ state:InitalizeState?, _ error:ServiceError?) -> Void)!) {
        
        ServiceContext.context.state = InitalizeState.started
        ServiceContext.context.configuration = configuration
        ServiceContext.context.state = InitalizeState.completed

        completionHandler(ServiceContext.context.state,nil)
    }
    
    /**
     * @discussion This method will get a list of travels as per requested criteria. This method accepts a DeparturesRequest object and completion block that contain DeparturesResponse object and ServiceError error object.
     *
     * @param request The input value representing the DeparturesRequest object.
     *
     * @param callback This block will return DeparturesResponse object or ServiceError object.
     */
    public func executeDeparturesService(with request:DeparturesRequest!, callback:@escaping ((_ response:DeparturesResponse?, _ error:ServiceError?) -> Void)) {
        
        if ServiceContext.context.state != InitalizeState.completed {
            
            callback(nil, Utilities.sdkNotInitalize())
        } else if !Utilities.isNetworkAvailable() {
            
            callback(nil, Utilities.internetNotAvailable())
        } else {
            
            let service:DeparturesService = DeparturesService(with: Communicator.shared)
            service.executeRequest(request: request) { (response, error) in
                callback(response as? DeparturesResponse, error)
            }
        }
    }
}
