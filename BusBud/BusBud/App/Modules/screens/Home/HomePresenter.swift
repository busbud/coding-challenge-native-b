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
import BBServices

final class HomePresenter: PresenterInterface {

    var router: HomeRouterPresenterInterface!
    var interactor: HomeInteractorPresenterInterface!
    weak var viewModel: HomeViewModel!
    
    var request: AnyCancellable?
}

extension HomePresenter: HomePresenterRouterInterface {

}

extension HomePresenter: HomePresenterInteractorInterface {
    
    func results(_ travels: DeparturesResponse) {
        
        self.viewModel.results = travels;
        print(self.viewModel.results!.locations);
    }
}

extension HomePresenter: HomePresenterViewInterface {
    
    func fetchCities() {
        
        self.viewModel.cities = City.defaultCities;
    }
    
    func fetchTravels(from:String, to:String, date:Date, passanger: Int) {
        
        self.interactor.fetchTravels(from: "",to: "",date: date,passanger: passanger);
    }

}
