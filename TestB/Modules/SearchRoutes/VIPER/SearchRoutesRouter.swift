
import UIKit

protocol SearchRoutesRouter: AnyObject {
  var viewController: UIViewController { get }
}

protocol SearchRoutesRouterOutput: AnyObject {}

final class DefaultSearchRoutesRouter {

  let viewController: UIViewController
  private let presenter: DefaultSearchRoutesPresenter

  init(presenter: DefaultSearchRoutesPresenter,
       viewController: UIViewController) {
    self.presenter = presenter
    self.viewController = viewController
  }
}

extension DefaultSearchRoutesRouter: SearchRoutesRouter {
}
