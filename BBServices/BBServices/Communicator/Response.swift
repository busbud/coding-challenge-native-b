//
//  Response.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This model is use for response of communicator.
 */
internal class Response:NSObject {

    /**
     * This property hold the value of Data object.
     */
    internal var responseBody:Data?
    
    /**
     * This property hold the value of HTTPURLResponse object.
     */
    internal var response:HTTPURLResponse?
}
