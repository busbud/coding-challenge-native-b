//
//  VIPER.swift
//  busbud
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

// MARK: - VIPER

/**
* @discussion This protocol implements by view
*/
public protocol RouterInterface: RouterToPresenterInterface {
    
    associatedtype PresenterRouter
    var presenter: PresenterRouter! { get set }
}

/**
* @discussion This protocol implements by presenter
*/
public protocol InteractorInterface: InteractorToPresenterInterface {
    
    associatedtype PresenterInteractor
    var presenter: PresenterInteractor! { get set }
}

/**
* @discussion This protocol implements by router and interector
*/
public protocol PresenterInterface: PresenterToRouterInterface & PresenterToInteractorInterface & PresenterToViewInterface {
    
    associatedtype RouterPresenter
    associatedtype InteractorPresenter

    var router: RouterPresenter! { get set }
    var interactor: InteractorPresenter! { get set }
}

/**
* @discussion This protocol implements by router and interector
*/
public protocol ViewInterface {
    
    associatedtype PresenterView
    var presenter: PresenterView! { get set }
}

// MARK: - "i/o" transitions

public protocol RouterToPresenterInterface: class {
    
}

public protocol InteractorToPresenterInterface: class {
    
}

public protocol PresenterToRouterInterface: class {
    
}

public protocol PresenterToInteractorInterface: class {
    
}

public protocol PresenterToViewInterface: class {
    
}

// MARK: - module

public protocol ModuleInterface {

    associatedtype View where View: ViewInterface
    associatedtype Presenter where Presenter: PresenterInterface
    associatedtype Router where Router: RouterInterface
    associatedtype Interactor where Interactor: InteractorInterface
    
    func assemble(presenter: Presenter, router: Router, interactor: Interactor)
}

public extension ModuleInterface {

    func assemble(presenter: Presenter, router: Router, interactor: Interactor) {

        presenter.interactor = (interactor as! Self.Presenter.InteractorPresenter)
        presenter.router = (router as! Self.Presenter.RouterPresenter)
        interactor.presenter = (presenter as! Self.Interactor.PresenterInteractor)
        router.presenter = (presenter as! Self.Router.PresenterRouter)
    }
}
