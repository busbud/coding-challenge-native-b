//
//  ApiManager.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import Combine
import Alamofire

class APIManager {
    private var subscribers = Set<AnyCancellable>()
    
    func fetch<T: Decodable> (request: APIRequest,
                              completion: @escaping (Result<T, Error>) -> Void) {
        guard let endpoint = request.endpoint else { return }
        AF.request(endpoint.urlString, method: .get, parameters: request.parameters, headers: request.headers)
            .publishDecodable(type: T.self)
            .sink(receiveCompletion: { resultCompletion in
                switch resultCompletion {
                case .failure(let error):
                    completion(.failure(error))
                case .finished: break
                }
            }, receiveValue: { response in
                switch response.result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
            .store(in: &subscribers)
        
    }
}
