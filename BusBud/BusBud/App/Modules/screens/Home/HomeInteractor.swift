//
//  HomeInteractor.swift
//  busbud
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import Combine
import BBServices

final class HomeInteractor: InteractorInterface {

    weak var presenter: HomePresenterInteractorInterface!
}

extension HomeInteractor: HomeInteractorPresenterInterface {
    
    func fetchTravels(from: String, to: String, date: Date, passanger: Int) {
        
        
         let language = Language.languages.first(where: {$0.alpha2 == "en"})!
         let currency = Currency.currencies.first(where: {$0.code == "USD"})!
         let request = DeparturesRequest(origin: "f25dvk", destination: "dr5reg", on: Date(), adult: 1, child: 0, senior: 0, lang: language, currency: currency)
         
         Services.shared.executeDeparturesService(with: request) { (response, error) in
             
            if((response) != nil) {
                
                self.presenter.results(response!);
            }
         }
    }
}
