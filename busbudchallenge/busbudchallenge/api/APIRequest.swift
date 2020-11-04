//
//  Request.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation
import Alamofire

class APIRequest {
    private var _headers = HTTPHeaders()
    
    var endpoint: Endpoint?
    var parameters: Parameters?
    var headers: HTTPHeaders {
        get { return _headers }
    }
    
    init() {
        _headers.add(HTTPHeader(name: "Accept", value: "application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/"))
        _headers.add(HTTPHeader(name: "X-Busbud-Token", value: "PARTNER_BaASYYHxTxuOINEOMWq5GA"))
    }
    
    func createRequest(with data: Sections) -> APIRequest {
        self.endpoint = Endpoint.search(from: data.departureInfo.first!.geohash!,
                                        to: data.departureInfo.last!.geohash!,
                                        date: data.departureDates.first!.isoFormatted ,
                                        poll: false)

        self.parameters = data.passengers.reduce([String:Int]()) { (dict, value) -> [String: Int] in
            var params = dict
            params[value.type.rawValue] = value.count
            return params
        }
        self.parameters?[K.Identifiers.language] = Locale.current.languageCode ?? "en"
        self.parameters?[K.Identifiers.currency] = Locale.current.currencyCode ?? "USD"
        return self
    }
}
