//
//  HomePresenter.swift
//  busbud
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class HomePresenter: PresenterInterface {

    var router: HomeRouterPresenterInterface!
    var interactor: HomeInteractorPresenterInterface!
    weak var viewModel: HomeViewModel!
    
    var request: AnyCancellable?
}

extension HomePresenter: HomePresenterRouterInterface {

}

extension HomePresenter: HomePresenterInteractorInterface {

}

extension HomePresenter: HomePresenterViewInterface {

}
