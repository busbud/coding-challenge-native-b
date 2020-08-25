///
//
//  Created by Rafael Moraes on 17/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation
import PromiseKit

class SearchInteractor: SearchInteractorProtocol {

    var searchResponse = SearchResponse()

    var mainService: Service {
        get {
            return ServiceFactory.service(.search)
        }
    }

    var searchService: SearchServiceProtocol {
        return mainService as! SearchServiceProtocol
    }
    
    func initSearch(with origin: String, destination: String, date: String) -> Promise<SearchResponse> {
        
        return searchService.initSearch(with: origin, destination: destination, date: date)
    }
    
    func pollSearch(with origin: String, destination: String, date: String) -> Promise<SearchResponse> {
        
        return searchService.pollSearch(with: origin, destination: destination, date: date)
    }
    
}
