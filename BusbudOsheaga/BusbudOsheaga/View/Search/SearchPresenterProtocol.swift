//
//  SearchPresenterProtocol.swift
//  GoogleBooks
//
//  Created by Rafael Moraes on 17/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation

protocol SearchPresenterProtocol: Presenter {
    var searchInteractor: SearchInteractorProtocol { get }
    var searchItemsChanged: ((SearchResponse) -> Void)? { get set }
    var displayAlert: (((title: String, content: String)) -> Void)? { get set }
    var isLoadingResults: ((Bool) -> Void)? { get set }
    func userStartedSearch()
}
