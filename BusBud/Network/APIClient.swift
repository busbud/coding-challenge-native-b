//
//  APIClient.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation
import Alamofire



class APIClient {
    
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T> , HTTPURLResponse?,String?)->Void) -> DataRequest {
    
        var resultString :String = ""
        return AF.request(route)
            .responseString(completionHandler: { (result) in
                resultString = result.value ?? ""
            })
            .responseDecodable (decoder: decoder){ (response: DataResponse<T,AFError>) in
                completion(response.result,response.response,resultString)
        }
    }
    
    
    
    //GET init search
    static func getInitSearchData(
        origin:String,
        destination:String,
        date:String,
        adult:String = "",
        child:String = "",
        senior:String = "",
        lang:String = "",
        currency:String = "",
        completion:@escaping (AFResult<RouteModel> ,HTTPURLResponse?,_ resultString:String?)->Void) {
        
        performRequest(route: APIRouter.getInitSearchData(origin: origin, destination: destination, date: date, adult: adult, child: child, senior: senior, lang: lang, currency: currency), completion: completion)
    }
    
    
    //GET more search
    static func getMoreSearchData(
        origin:String,
        destination:String,
        date:String,
        adult:String = "",
        child:String = "",
        senior:String = "",
        lang:String = "",
        currency:String = "",
        completion:@escaping (AFResult<[testModel]> ,HTTPURLResponse?,_ resultString:String?)->Void) {
        
        performRequest(route: APIRouter.getMoreSearchData(origin: origin, destination: destination, date: date, adult: adult, child: child, senior: senior, lang: lang, currency: currency), completion: completion)
    }

}
