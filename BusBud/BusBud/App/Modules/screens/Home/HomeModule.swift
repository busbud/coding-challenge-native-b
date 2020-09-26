//
//  HomeModule.swift
//  busbud
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

// MARK: - router

protocol HomeRouterPresenterInterface: RouterToPresenterInterface {

}

// MARK: - presenter

protocol HomePresenterRouterInterface: PresenterToRouterInterface {

}

protocol HomePresenterInteractorInterface: PresenterToInteractorInterface {

}

protocol HomePresenterViewInterface: PresenterToViewInterface {

}

// MARK: - interactor

protocol HomeInteractorPresenterInterface: InteractorToPresenterInterface {

}

// MARK: - module builder

final class HomeModule: ModuleInterface {
    
    typealias View = HomeView
    typealias Presenter = HomePresenter
    typealias Router = HomeRouter
    typealias Interactor = HomeInteractor

    func build() -> UIViewController {
        
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()

        let viewModel = HomeViewModel()
        let view = View(presenter: presenter, viewModel: viewModel)
            .environmentObject(HomeEnvironment())
        presenter.viewModel = viewModel

        self.assemble(presenter: presenter, router: router, interactor: interactor)

        let viewController = UIHostingController(rootView: view)
        router.viewController = viewController
        
        return viewController
    }
}
