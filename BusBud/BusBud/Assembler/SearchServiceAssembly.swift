//
//  SearchServiceAssembly.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class SearchServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchService.self,
                           name: "online") { resolver in
            let api = resolver ~> (SearchAPI.self)
            return OnlineSearchService(searchAPI: api)
        }
    }
}
