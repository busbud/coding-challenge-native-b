//
//  SearchAssembly.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import UIKit

class SearchViewAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchViewModel.self) { resolver in
            let searchService = resolver ~> (SearchService.self, name:"online")
            return SearchViewModel(searchService: searchService)
        }

        container.register(SearchViewController.self) { resolver in
            let viewContoller = SearchViewController()
            let viewModel = resolver ~> SearchViewModel.self
            viewModel.router = SearchRouter(topViewController: viewContoller)
            viewContoller.viewModel = viewModel
            return viewContoller
        }
    }
}
