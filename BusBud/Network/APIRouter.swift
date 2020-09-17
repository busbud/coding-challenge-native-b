//
//  APIRouter.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getInitSearchData(origin:String,
                           destination:String,
                           date:String,
                           adult:String,
                           child:String,
                           senior:String,
                           lang:String,
                           currency:String)
    
    case getMoreSearchData(origin:String,
                           destination:String,
                           date:String,
                           adult:String,
                           child:String,
                           senior:String,
                           lang:String,
                           currency:String,
                           index:String)

    
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
//        case
//            return .post
            
        case .getInitSearchData, .getMoreSearchData:
            return .get
        }

    }
    
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getInitSearchData(let origin,let destination, let date, _,_,_,_,_):
            return "x-departures/\(origin)/\(destination)/\(date)"
            
        case .getMoreSearchData(let origin,let destination, let date, _,_,_,_,_,_):
            return "x-departures/\(origin)/\(destination)/\(date)/poll"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .getInitSearchData(_ ,_ , _, let adult, let child, let senior, let lang, let currency):
            return [APIParameterKey.x_departures.adult:adult,
                    APIParameterKey.x_departures.child:child,
                    APIParameterKey.x_departures.senior:senior,
                    APIParameterKey.x_departures.lang:lang,
                    APIParameterKey.x_departures.currency:currency]
            
        case .getMoreSearchData(_ ,_ , _, let adult, let child, let senior, let lang, let currency,let index):
               return [APIParameterKey.x_departures.adult:adult,
                       APIParameterKey.x_departures.child:child,
                       APIParameterKey.x_departures.senior:senior,
                       APIParameterKey.x_departures.lang:lang,
                       APIParameterKey.x_departures.currency:currency,
                       APIParameterKey.x_departures.index: index]
        }
    }
    

    
    
    func asURLRequest() throws -> URLRequest {
        
        var url = try serverAddress.baseApiURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        if method == .get {
            url = URL(string: "\(serverAddress.baseApiURL)\(path)")!
            urlRequest = URLRequest(url: url)
        }
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        
        
        // Headers
        urlRequest.setValue(ContentHeaderValue.accept.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentHeaderValue.x_busbud_token.rawValue, forHTTPHeaderField: HTTPHeaderField.busbudToken.rawValue)
        
        
        // Parameters
        if let parameters = parameters {
            do {
                if method == .get {
                    urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                }else{
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                }
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
   
        }
        
        
        
        return urlRequest
    }


}
