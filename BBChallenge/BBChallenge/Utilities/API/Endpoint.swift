//
//  Endpoint.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import Foundation

/// Basic generic structure for any Endpoint
protocol Endpoint {
    var base: String { get }
    var headers: [String:String]? { get }
    var path: String { get }
}

extension Endpoint {
    
    /// Basic generic method to get the URL for any Endpoint
    func getUrl(path pathParameters: [String]? = nil,
                with parameters: [String:String]? = nil
    ) -> URLComponents? {
        let endpointUrl =  "\(self.base)/\(pathParameters?.joined(separator: "/") ?? "")"
        var url = URLComponents(string: endpointUrl)
        
        var queryItems = [URLQueryItem]()
        parameters?.forEach { (key, value) in
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        url?.queryItems = queryItems
        
        return url
    }
    
    /// Basic generic structure to get the request of any Endpoint
    func getRequest(path pathParameters: [String]? = nil,
                    with parameters: [String:String]? = nil
    ) -> URLRequest? {
        guard let url = getUrl(path: pathParameters, with: parameters)?.url else {
            return nil
        }
        var request = URLRequest(url: url)
        headers?.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
