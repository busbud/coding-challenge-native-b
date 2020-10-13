//
//  APIAssembly.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import Foundation
import Swinject

class APIAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchAPI.self) {  _ in
            return SearchAPI(base: "https://napi.busbud.com")
        }
    }
}
