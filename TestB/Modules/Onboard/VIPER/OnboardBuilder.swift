

final class OnboardBuilder {

  func build(withListener listener: OnboardListener) -> OnboardRouter {
    let viewController = OnboardViewController()
    let interactor = DefaultOnboardInteractor()
    let presenter = DefaultOnboardPresenter(
      view: viewController,
      interactor: interactor
    )
    let router = DefaultOnboardRouter(
      presenter: presenter,
      viewController: viewController
    )
    viewController.output = presenter
    interactor.output = presenter
    presenter.router = router
    return router
  }
}
