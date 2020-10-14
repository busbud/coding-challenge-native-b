
import Foundation

protocol SearchRoutesInteractor: AnyObject {
  func getDepartures(origin: GeoHash,
                     destination: GeoHash,
                     outboundDate: Date,
                     numberOfAdults: Int)
  func backToOnboarding()
}

protocol SearchRoutesInteractorOutput: AnyObject {
  func update(with xDepartures: XDepartures)
}


final class DefaultSearchRoutesInteractor {
  weak var output: SearchRoutesInteractorOutput?
  private let service: SearchRoutesService
  private let listener: SearchRoutesListener
  private var index = 0
  typealias MoreDeparturesCall = () -> ()

  init(service: SearchRoutesService,
       listener: SearchRoutesListener) {
    self.service = service
    self.listener = listener
  }
}

extension DefaultSearchRoutesInteractor: SearchRoutesInteractor {
  func getDepartures(origin: GeoHash,
                     destination: GeoHash,
                     outboundDate: Date,
                     numberOfAdults: Int) {
    service.getDepartures(origin: origin,
                          destination: destination,
                          outboundDate: outboundDate,
                          numberOfAdults: numberOfAdults) {[weak self] result in
                            self?.handle(result: result, moreDeparturesCall: { [weak self] in
                              self?.getMoreDepartures(origin: origin,
                                                      destination: destination,
                                                      outboundDate: outboundDate,
                                                      numberOfAdults: numberOfAdults)
                            })
    }
  }


  func getMoreDepartures(origin: GeoHash,
                     destination: GeoHash,
                     outboundDate: Date,
                     numberOfAdults: Int) {
    service.getMoreDepartures(origin: origin,
                          destination: destination,
                          outboundDate: outboundDate,
                          numberOfAdults: numberOfAdults,
                          index: index) {[weak self] result in
                            self?.handle(result: result, moreDeparturesCall: { [weak self] in
                              self?.getMoreDepartures(origin: origin,
                                                      destination: destination,
                                                      outboundDate: outboundDate,
                                                      numberOfAdults: numberOfAdults)
                            })
    }
  }


  private func handle(result: XDeparturesResult, moreDeparturesCall: MoreDeparturesCall?) {
    switch result {
      case .success(let xDepartures):
        handleDepartures(xDepartures: xDepartures, moreDeparturesCall: moreDeparturesCall)
      case .failure(let error):
        handleError(error: error)
    }
  }

  func backToOnboarding() {
    listener.backToOnboarding()
  }
}

extension DefaultSearchRoutesInteractor {
  private func handleDepartures(xDepartures: XDepartures, moreDeparturesCall: MoreDeparturesCall?) {
    index += xDepartures.departures?.count ?? 0
    output?.update(with: xDepartures)
    if !xDepartures.complete {
      moreDeparturesCall?()
    }
  }

  private func handleError(error: NetworkError) {

  }
}
