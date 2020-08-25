//
//  SearchPresenter.swift
//  GoogleBooks
//
//  Created by Rafael Moraes on 17/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation
import PromiseKit

struct Completed : Error {}

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
        let origin = "f244m6"
        let destination = "f25dvk"
        let date = "2020-08-25"
        searchInteractor.initSearch(with: origin , destination: destination, date: date).done { (response) in
            self.searchItemsChanged?(response)
            if !response.complete {
                let timeToLeave = Double(response.ttl!)
                let timestampToBackoff = Date().timeIntervalSinceNow + timeToLeave
                after(.seconds(2)).done{ _ in self.poll(seconds: 2, task: self.searchInteractor.pollSearch(with: origin, destination: destination, date: date), ttl: timestampToBackoff).catch(self.onError(error:))}
            }
        }.catch (self.onError(error:))
    }
    
    func poll(seconds time: Int, task: Promise<SearchResponse>, ttl: TimeInterval) -> Promise<Void> {
        return task.done { response in
            self.searchItemsChanged?(response)
            if response.complete || Date().timeIntervalSinceNow > ttl {
                self.isLoadingResults?(false)
            } else {
                after(.seconds(time)).done {
                    return self.poll(seconds: time, task: task, ttl: ttl).catch(self.onError(error:))
                }
            }
        }
    }
    
    func onError(error: Error) {
        self.isLoadingResults?(false)
        self.displayAlert?((title: "Error", content: error.localizedDescription))
    }
}
