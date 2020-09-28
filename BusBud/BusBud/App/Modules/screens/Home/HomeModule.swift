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
import BBServices

// MARK: - router

protocol HomeRouterPresenterInterface: RouterToPresenterInterface {

}

// MARK: - presenter

protocol HomePresenterRouterInterface: PresenterToRouterInterface {

}

protocol HomePresenterInteractorInterface: PresenterToInteractorInterface {

    func results(_ trvels:DeparturesResponse)
}

protocol HomePresenterViewInterface: PresenterToViewInterface {

    func fetchCities()
    
    func fetchTravels(from:String, to:String, date:Date, passanger: Int)

}

// MARK: - interactor

protocol HomeInteractorPresenterInterface: InteractorToPresenterInterface {
    func fetchTravels(from:String, to:String, date:Date, passanger: Int)
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
        presenter.viewModel = viewModel
        let view = View(presenter: presenter, viewModel: viewModel)
            .environmentObject(HomeEnvironment())

        self.assemble(presenter: presenter, router: router, interactor: interactor)

        let viewController = UIHostingController(rootView: view)
        router.viewController = viewController
        
        return viewController
    }
}
