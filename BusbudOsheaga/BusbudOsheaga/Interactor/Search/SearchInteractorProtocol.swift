//
//  SearchInteractorProtocol.swift
//
//  Created by Rafael Moraes on 17/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation
import PromiseKit

protocol SearchInteractorProtocol: Interactor {

    var searchService: SearchServiceProtocol { get }

    func initSearch(with origin: String, destination: String, date: String) ->
        Promise<SearchResponse>
    
    func pollSearch(with origin: String, destination: String, date: String) -> Promise<SearchResponse> 
}
