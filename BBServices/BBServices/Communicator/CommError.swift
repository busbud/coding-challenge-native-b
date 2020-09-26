//
//  CommError.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This class is use for error of communicator.
 */
internal class CommError: Error {

    /**
     * This property hold the String object. It's contain error message.
     */
    internal var errorMessage:String!
    
    /**
     * This property hold the Int object. It's contain error code.
     */
    internal var errorCode:Int!
}
