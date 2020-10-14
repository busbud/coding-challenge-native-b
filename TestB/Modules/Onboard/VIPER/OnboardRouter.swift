
import UIKit

protocol OnboardRouter: AnyObject {
  var viewController: UIViewController { get }
  func showSearchScreen()
}

protocol OnboardRouterOutput: AnyObject {}

final class DefaultOnboardRouter {

  let viewController: UIViewController
  private let presenter: DefaultOnboardPresenter
  weak var listener: OnboardListener?
  private var router: SearchRoutesRouter?
  
  init(presenter: DefaultOnboardPresenter,
       viewController: UIViewController) {
    self.presenter = presenter
    self.viewController = viewController
  }
}

extension DefaultOnboardRouter: OnboardRouter {
  func showSearchScreen() {
    let searchRoutesDefaultDependency = SearchRoutesDefaultDependency()
    router = DefaultSearchRoutesBuilder(dependency: searchRoutesDefaultDependency).build(withListener: self)
    if let viewController = router?.viewController {
      self.viewController.present(viewController, animated: true, completion: nil)
    }
  }
}

extension DefaultOnboardRouter: SearchRoutesListener {
  func backToOnboarding() {
    self.viewController.dismiss(animated: true, completion: nil)
  }
}
