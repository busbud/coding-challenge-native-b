
import UIKit

final class MainEntry {

  var router: OnboardRouter? // variable defined to hold a strong reference

  func mainViewController() -> UIViewController? {
    router = OnboardBuilder().build(withListener: self)
    return router?.viewController
  }
}

extension MainEntry: OnboardListener {

}
