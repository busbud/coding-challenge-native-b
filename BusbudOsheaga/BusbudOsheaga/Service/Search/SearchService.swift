///
//
//  Created by Rafael Moraes on 03/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation
import PromiseKit

class SearchService: SearchServiceProtocol {

    var serviceAPI: API {
        get{
            return APIFactory.api(for: self)
        }
    }

    var api: BusbudAPI {
        get {
            //This will force crash if the architercture is flawed
            return serviceAPI as! BusbudAPI
        }
    }

    func initSearch(with origin: String, destination: String, date: String ) -> (Promise<SearchResponse>) {

        if origin.isEmpty || destination.isEmpty || date.isEmpty {
            return Promise<SearchResponse>() { _ in
                throw APIError.badRequest
            }
        }

        var searchParams = SearchParams()
        searchParams.origin = origin
        searchParams.destination = destination
        searchParams.date = date
        let callableAPI = api
        return callableAPI.performGenericRequest(SearchRouter.initSearch(baseUrl: callableAPI.basePath,searchParams: searchParams))
    }
    
    func pollSearch(with origin: String, destination: String, date: String ) -> (Promise<SearchResponse>) {

        if origin.isEmpty || destination.isEmpty || date.isEmpty {
            return Promise<SearchResponse>() { _ in
                throw APIError.badRequest
            }
        }

        var searchParams = SearchParams()
        searchParams.origin = origin
        searchParams.destination = destination
        searchParams.date = date
        let callableAPI = api
        return callableAPI.performGenericRequest(SearchRouter.pollSearch(baseUrl: callableAPI.basePath,searchParams: searchParams))
    }

}
