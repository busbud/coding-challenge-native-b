//
//  DeparturesViewModel.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import Foundation

class DeparturesViewModel {
    var onFetchDepartures: ((_ isDeptartureExist: Bool) -> Void)?
    var onFetchDeparturesError: ((Error) -> Void)?
    
    let originCity: City
    let destinationCity: City
    let outboundDate: String
    
    private var canLoadMore: Bool = true
    
    private(set) var departuresVMs = [DepartureTableCellVM]()
    
    private lazy var busbudOperationQueue: OperationQueue = {
        let operation = OperationQueue(with: "com.gemelyanov.operationQueue")
        operation.maxConcurrentOperationCount = 1
        return operation
    }()
    
    init(originCity: City, destinationCity: City, outboundDate: String) {
        self.originCity = originCity
        self.destinationCity = destinationCity
        self.outboundDate = outboundDate
    }
    
    func fetchDepartures() {
        let operation = DeparturesOperation(origin: originCity.geohash,
                                            destination: destinationCity.geohash,
                                            outboundDate: outboundDate,
                                            isPoll: false,
                                            index: nil)
        operation.getDeparturesDataCompletion = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                let parsingResult = self.parseResponse(response)
                self.canLoadMore = parsingResult.canLoadMore
                self.departuresVMs.append(contentsOf: parsingResult.vms)
                
                DispatchQueue.main.async {
                    self.onFetchDepartures?(!self.departuresVMs.isEmpty)
                }
            case let .failure(error):
                DispatchQueue.main.async { [weak self] in
                    self?.onFetchDeparturesError?(error)
                }
            }
        }
        busbudOperationQueue.addOperation(operation)
    }
}

private extension DeparturesViewModel {
    typealias ParsingResult = (canLoadMore: Bool, vms: [DepartureTableCellVM])
    
    func parseResponse(_ response: DeparturesResponse) -> ParsingResult {
        var viewModels = [DepartureTableCellVM]()
        
        guard
            let originCity = response.cities.first(where: { $0.id == response.originCityId }),
            let destCity = response.cities.first(where: { $0.id == response.destinationCityId })
        else { return (false, viewModels)}
        
        viewModels = response.xDepartures.compactMap({ departure -> DepartureTableCellVM? in
            guard let location = response.locations.first(where: { $0.id == departure.destinationLocationId }) else { return nil }
            return DepartureTableCellVM(departure: departure, originCity: originCity, destCity: destCity, location: location)
        })
        
        return (!response.isCompleted, viewModels)
    }
}
