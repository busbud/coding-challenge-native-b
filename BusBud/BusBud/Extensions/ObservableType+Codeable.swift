//
//  ObservableType+Codeable.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-07.
//

import Foundation
import RxSwift

extension ObservableType {
    public func mapObject<T: Codable>(type: T.Type) -> Observable<T> {
        return flatMap { jsonData -> Observable<T> in
            guard let data = jsonData as? Data else {
                throw NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "Could not decode object"]
                )
            }
            let decoder = JSONDecoder()
            let object = try decoder.decode(T.self, from: data)
            return Observable.just(object)
        }
    }

    public func mapArray<T: Codable>(type: T.Type) -> Observable<[T]> {
        return flatMap { jsonData -> Observable<[T]> in
            guard let data = jsonData as? Data else {
                throw NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "Could not decode object"]
                )
            }
            let decoder = JSONDecoder()
            let objects = try decoder.decode([T].self, from: data)
            return Observable.just(objects)
        }
    }
}
