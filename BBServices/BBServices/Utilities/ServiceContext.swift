//
//  ServiceContext.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This class hold the gobal vaule which requires for framework.
 */
internal class ServiceContext: NSObject {

    /**
     * This property hold the value of InitalizeState.
     */
    internal static let context = ServiceContext()
    
    /**
     * This property hold the value of InitalizeState.
     */
    internal var state:InitalizeState
    
    /**
     * This property hold the value of Configuration object.
     */
    internal var configuration:Configuration
    
    /**
     * This property hold the value of InitalizeState.
     */
    private override init() {

        self.state = InitalizeState.started
        self.configuration = Configuration.shared
    }
}
