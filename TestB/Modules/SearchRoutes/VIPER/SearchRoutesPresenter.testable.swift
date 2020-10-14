
import Foundation

final class DefaultSearchRoutesPresenter {

  private let view: SearchRoutesView
  private let interactor: SearchRoutesInteractor
  weak var router: SearchRoutesRouter?
  private var viewModel = SearchRoutesViewModel()

  init(view: SearchRoutesView,
       interactor: SearchRoutesInteractor) {
    self.view = view
    self.interactor = interactor
  }
}

extension DefaultSearchRoutesPresenter: SearchRoutesViewOutput {
  func viewDidLoad() {
    // params can be passed from view
    interactor.getDepartures(origin: "f2m673",
                             destination: "f25dvk",
                             outboundDate: Date(dateStr: "2020-10-15")!, // local time in Singapore
                             numberOfAdults: 1)

  }

  func viewWillAppear() {}

  func viewDidDisappear() {}

  func backToOnboarding() {
    interactor.backToOnboarding()
  }
}

extension DefaultSearchRoutesPresenter: SearchRoutesInteractorOutput {
  func update(with xDepartures: XDepartures) {
    guard let departures = xDepartures.departures, departures.count > 0 else { return }
    for departure in departures {
      let cellModel = DepartureCellModel(id: departure.id,
                                         departureTime: departure.departure_time,
                                         arrivalTime: departure.arrival_time,
                                         locationName: xDepartures.locationName(locationID: departure.origin_location_id),
                                         price: departure.prices.total,
                                         currency: xDepartures.currenyname(locationID: departure.origin_location_id))
      viewModel.add(departure: cellModel)
    }
    view.configure(with: viewModel)
  }
}
