//
//  Configuration.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This enum is for different type of server.
 */
public enum ServiceType:String {

    /**
     * staging server.
     */
    case local

    /**
     * staging server.
     */
    case staging
    
    /**
     * live server.
     */
    case live
}

/**
 * This class was designed and implemented for common configuration of the services.
 */
public class Configuration:NSObject {

    /**
     * @discussion shared return the singleton object of this class.
     */
    public static let shared = Configuration()
    
    /**
     * This init method is private.
     */
    private override init() {
        
        serviceType = ServiceType.live
        isLoggigEnable = false
        version = "1.0.0"
    }
    
    /**
     * This property hold the ServiceType object.
     */
    public var serviceType:ServiceType!
    
    /**
     * This property hold the isLoggigEnable bool value. by default isLoggigEnable false.
     */
    public var isLoggigEnable:Bool!
    
    /**
     * This property hold the app version.
     */
    public var version:String!
}

internal extension Configuration {
    
    /**
     * This method check validation of this class.
     *
     * @param error This object represent ServiceError which will return if error
     *
     * @return bool if validatation is success then return true else return false
     */
    func isValidConfiguration(error: inout ServiceError?) -> Bool {
        
        return true
    }
}
