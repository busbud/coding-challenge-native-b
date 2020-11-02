//
//  ResultsViewModel.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation
import Combine

class ResultsViewModel {
    
    private let apiManager: APIManager
    private let resultRequest: APIRequest
    
    var responseSubject = PassthroughSubject<Response, Error>()
    
    init(apiManager: APIManager, resultRequest: APIRequest) {
        self.apiManager = apiManager
        self.resultRequest = resultRequest
    }
    
    func fetchResults() {
        apiManager.fetch(request: resultRequest) { [weak self] (result: Result<Response, Error>) in
            switch result {
            case .success(let response):
                self?.responseSubject.send(response)
            case .failure(let error):
                self?.responseSubject.send(completion: .failure(error))
            }
        }
    }
    
}
