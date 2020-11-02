//
//  HomeInterfaces.swift
//  Osheaga Routes
//
//  Created by user on 01/11/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

struct SearchParameters {
    let fromCity, toCity: City
    let date: Date
    let adultsCount: Int
}

protocol HomeWireframeInterface: WireframeInterface {
    func openOnboarding()
}

protocol HomeViewInterface: ViewInterface {
    func reloadResultsTableView()
    func setMessage(_ message: String?, tryAgainButtonHidden: Bool)
}

protocol HomePresenterInterface: PresenterInterface {
    
    func viewDidLoad()
    func onUserPressedSearch()
}

protocol HomeInteractorInterface: InteractorInterface {
    
    func getSearchResultsCount() -> Int
    
    func getSearchResultsDeparture(at indexPath: IndexPath) -> Departure?
    func getSearchResultsLocation(with id: Int) -> Location?
    
    func performSearch(searchParams: SearchParameters, completion: @escaping (_ success: Bool, _ error: Error?) -> Void)
}
