//
//  ResultsViewModel.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation
import Combine

class ResultsViewModel {
    
    private let apiManager = APIManager()
    private var resultRequest: APIRequest
    private var data: Sections
    
    var responseSubject = PassthroughSubject<Response, Error>()
    
    init(data: Sections) {
        self.data = data
        self.resultRequest = APIRequest().createRequest(with: data)
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

extension ResultsViewModel {
    // this is intended so we can fetch data if there is no answer for the events date
    // this is just for showcase, NEVER USE IT for a production enviroment
    func fetchAgain() {
        data.departureDates[0].date = Date()
        resultRequest = APIRequest().createRequest(with: data)
        fetchResults()
    }
}
