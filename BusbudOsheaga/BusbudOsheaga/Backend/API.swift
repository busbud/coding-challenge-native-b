//
//  Created by Rafael Moraes on 15/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//
import Alamofire
import Foundation
import PromiseKit

protocol API {

    //Some services might need a different URL, but usually the API should initiate the
    init(_ baseURL: URL?)
    var basePath: String { get }
    func performGenericRequest<T:Codable>(_ urlRequest: AlamofireRequestConvertible) -> Promise<T>
}

struct BusbudAPI: API {

    var basePath: String {
        get {
            return "https://napi.busbud.com"
        }
    }

    private var baseURL: URL?

    init(_ baseURL: URL? = nil) {
        if let url = baseURL {
            self.baseURL = url
        } else {
            self.baseURL = URL(string: basePath)!
        }
    }

    private var acceptableStatusCodes: [Int] {
        let array = Array(200 ..< 300)
        return array
    }
    
    func performGenericRequest<T:Codable>(_ urlRequest: AlamofireRequestConvertible) -> Promise<T> {
        let promise = Promise<T> { promised in

            Alamofire.request(urlRequest)
            .validate(statusCode: acceptableStatusCodes)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        print(String(data: data, encoding: .utf8) ?? "")
                        let result = try decoder.decode(T.self, from: data)
                        promised.fulfill(result)
                    } catch let err{
                        print(err)
                        promised.reject(APIError.parsingError)
                    }
                case .failure(let error):
                    if let data = response.data {
                        if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                            print("JSON Error \(json)")
                            promised.reject(APIError.serverError(json: json))
                        } else {
                            promised.reject(error)
                        }
                    } else {
                        promised.reject(error)
                    }
                }
            }
        }
        return (promise)
    }
}
