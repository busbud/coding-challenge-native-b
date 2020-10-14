
import Foundation

struct SearchRoutesViewModel {
  private var _items = [DepartureCellModel]()
  var departures: [DepartureCellModel] {
    get {
      return _items
    }
  }
  let backButtonText = "< back to onboarding"

  mutating func add(departure: DepartureCellModel) {
    let isDuplicate = _items.filter { model -> Bool in
      return model.id == departure.id
    }.count > 0

    guard !isDuplicate else { return }
    _items.append(departure)
  }
}
