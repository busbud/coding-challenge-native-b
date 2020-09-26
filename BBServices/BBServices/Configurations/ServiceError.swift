//
//  ServiceError.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This class is use for error of service.
 */
public class ServiceError: Error {

    /**
     * This property hold the String object. It's contain error message.
     */
    public var errorMessage:String!
    
    /**
     * This property hold the Int object. It's contain error code.
     */
    public var errorCode:Int!
}
