//
//  OnlineSearchService.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-07.
//

import Alamofire
import Foundation
import RxAlamofire
import RxSwift

class OnlineSearchService: SearchService {
    let searchAPI: SearchAPI

    init(searchAPI: SearchAPI) {
        self.searchAPI = searchAPI
    }

    func search(pathParams: SearchPathParams, query: SearchQueryParams) -> Observable<SearchResult> {
        let url = searchAPI.buildURL(pathParams: pathParams, needPoll: query.index != nil)
        return RxAlamofire
            .data(.get,
                  url,
                  parameters: query.dictionary,
                  encoding: URLEncoding.default,
                  headers: searchAPI.headers,
                  interceptor: nil)
            .debug()
            .mapObject(type: SearchResult.self)
    }
}
