//
//  BBAPIFetcher.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import Foundation
import Combine

/// Network API to search departures.
protocol BBAPIFetchable {
    func departures(withCriteria criteria: DeparturesCriteria)
        -> AnyPublisher<BusbudDeparturesJSON, Error>

}

class BBAPIFetcher: CombineAPI {

    var dataTask: URLSessionDataTask?
    
    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    /// Old data task request without publisher, used only for testing and debugging
    func fetchAPI<T>( with request: URLRequest, decodingType: T.Type) ->
        AnyPublisher<T, Error> where T: Decodable {
            let semaphore = DispatchSemaphore(value: 0)
            var decoded: AnyPublisher<T, Error>?
            var errorMessage: String = ""

            dataTask = session.dataTask(with: request) { [weak self] data, response, error in
                if let error = error {
                    errorMessage = error.localizedDescription
                } else if let data = data, let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    do {
                        _ = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    } catch {
                        _ = error.localizedDescription
                    }

                    decoded = decode(data)
                    semaphore.signal()
                } else {
                    // no data or response != 200
                }
                self?.dataTask = nil
            }
            dataTask?.resume()
            semaphore.wait()
            
            return decoded ?? Fail(error:
                APIError.parsing(description:"Couldn't parse response \(errorMessage)") as Error
            ).eraseToAnyPublisher()
    }
}

extension BBAPIFetcher: BBAPIFetchable {
    func departures(withCriteria criteria: DeparturesCriteria)
        -> AnyPublisher<BusbudDeparturesJSON, Error> {
        let pathParameters = [
            criteria.initialDestination,
            criteria.finalDestination,
            criteria.departureDate
        ]
        let queryParameters = [
            "adult": "\(criteria.adults)",
            "child": "\(criteria.children)",
            "senior":"\(criteria.seniors)",
            "lang": criteria.language.uppercased(),
            "currency": criteria.currency
        ]
        guard let request = BBAPIEndpoint.departures.getRequest(
            path: pathParameters,
            with: queryParameters
            ) else {
            let error = APIError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }

        return execute(request, decodingType: BusbudDeparturesJSON.self, retries: 2)
    }
}
