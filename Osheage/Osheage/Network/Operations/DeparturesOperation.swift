//
//  DeparturesOperation.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import Foundation

class DeparturesOperation: BusbudOperation {
    var getDeparturesDataCompletion: (Result<DeparturesResponse, Error>) -> Void = { _ in }
    
    private let origin: String
    private let destination: String
    private let outboundDate: String
    private let isPoll: Bool
    private let index: Int?
    
    private var response: DeparturesResponse?
    
    required init(origin: String, destination: String, outboundDate: String, isPoll: Bool, index: Int?) {
        self.origin = origin
        self.destination = destination
        self.outboundDate = outboundDate
        self.isPoll = isPoll
        self.index = index
        super.init()
    }
    
    override var endpoint: String {
        var basePart = "/x-departures/\(origin)/\(destination)/\(outboundDate)"
        if isPoll {
            basePart.append("/pool")
        }
        return basePart
    }
    
    override var queryItems: [URLQueryItem] {
        guard let index = index else { return [] }
        return [URLQueryItem(name: "index", value: "\(index)"),]
    }
    
    override func processResponseData(_ data: Data?) {
        if let response = departuresFromResponseData(data) {
            self.response = response
        }
        completed()
    }
    
    private func departuresFromResponseData(_ data: Data?) -> DeparturesResponse? {
        guard let data = data else { return nil }
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DeparturesResponse.dateFormatter)
            return try decoder.decode(DeparturesResponse.self, from: data)
        } catch {
            finish(with: error)
            return nil
        }
    }
    
    override func completed() {
        if let error = self.error {
            self.getDeparturesDataCompletion(.failure(error))
        } else if let response = self.response {
            self.getDeparturesDataCompletion(.success(response))
        }
        super.completed()
    }
}
