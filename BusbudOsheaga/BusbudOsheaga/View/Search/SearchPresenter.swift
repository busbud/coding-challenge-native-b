//
//  SearchPresenter.swift
//  GoogleBooks
//
//  Created by Rafael Moraes on 17/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation

struct SearchPresenter: SearchPresenterProtocol {

    var searchItemsChanged: ((SearchResponse) -> Void)?
    var displayAlert: (((title: String, content: String)) -> Void)?
    var isLoadingResults: ((Bool) -> Void)?

    internal var searchInteractor: SearchInteractorProtocol

    init() {
        searchInteractor = SearchInteractor()
    }

    func userStartedSearch() {
        isLoadingResults?(true)
        searchInteractor.initSearch(with: "dr5reg", destination: "f25dvk", date: "2021-07-29").done { (response) in
            self.searchItemsChanged?(response)
        }.catch { error in
            self.isLoadingResults?(false)
            self.displayAlert?((title: "Error", content: error.localizedDescription))
        }
    }

}
