//
//  Utilities.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

/**
 * This class was designed and implemented for common utilies of the services.
 */
internal class Utilities: NSObject {

    /**
     * @discussion getLocalizedStringForKey will gets the localaize string.
     *
     * @param key key name of localize string
     *
     * @return NSString object.
     */
    internal class func localizedString(for key:String) -> String {
        
        return NSLocalizedString(key, tableName: "Services", bundle: Bundle(for: self.classForCoder()), value: "", comment: "")
    }
    
    /**
     * @discussion sdkNotInitalize will return error object.
     *
     * @return ServiceError object.
     */
    internal class func sdkNotInitalize() -> ServiceError {
    
        let error = ServiceError()
        error.errorMessage = self.localizedString(for: kLocalizeKeyErrorSdkNotInitalize)
        error.errorCode = 10002
        
        return error
    }
    
    /**
     * @discussion somthingWentWrong will return error object.
     *
     * @return ServiceError object.
     */
    internal class func somthingWentWrong() -> ServiceError {
        
        let error = ServiceError()
        error.errorMessage = self.localizedString(for: kLocalizeKeyErrorSomthingWentWrong)
        error.errorCode = 10003
        
        return error
    }
    
    /**
     * @discussion internetNotAvailable will return error object.
     *
     * @return ServiceError object.
     */
    internal class func internetNotAvailable() -> ServiceError {
        
        let error = ServiceError()
        error.errorMessage = self.localizedString(for: kLocalizeKeyErrorInternetNotAvailable)
        error.errorCode = 10004
        
        return error
    }
    
    /**
     * @discussion isNetworkAvailable will check is internet available or not.
     *
     * @return BOOL value.
     */
    internal class func isNetworkAvailable() -> Bool {
                
        do {
            try Network.reachability = Reachability(hostname: "www.google.com")
            return true
        }
        catch {
            switch error as? Network.Error {
            case let .failedToCreateWith(hostname)?:
                print("Network error:\nFailed to create reachability object With host named:", hostname)
            case let .failedToInitializeWith(address)?:
                print("Network error:\nFailed to initialize reachability object With address:", address)
            case .failedToSetCallout?:
                print("Network error:\nFailed to set callout")
            case .failedToSetDispatchQueue?:
                print("Network error:\nFailed to set DispatchQueue")
            case .none:
                print(error)
            }
            return false
        }
    }
}
