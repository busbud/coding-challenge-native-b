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
    
    
    
    //GET search Data
    static func getSearchData(
        origin:String,
        destination:String,
        date:String,
        adult:String = "",
        child:String = "",
        senior:String = "",
        lang:String = "",
        currency:String = "",
        loadMore:Bool,
        index:Int = 0,
        completion:@escaping (AFResult<RouteModel> ,HTTPURLResponse?,_ resultString:String?)->Void) {
        
        if !loadMore {
            performRequest(route: APIRouter.getInitSearchData(origin: origin, destination: destination, date: date, adult: adult, child: child, senior: senior, lang: lang, currency: currency), completion: completion)
        }else{
            performRequest(route: APIRouter.getMoreSearchData(origin: origin, destination: destination, date: date, adult: adult, child: child, senior: senior, lang: lang, currency: currency,index: "\(index)"), completion: completion)

        }
    }

}
