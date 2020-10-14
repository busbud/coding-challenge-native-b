
final class DefaultSearchRoutesBuilder {
  let dependency: SearchRoutesDependency

  init(dependency: SearchRoutesDependency) {
    self.dependency = dependency
  }

  func build(withListener listener: SearchRoutesListener) -> SearchRoutesRouter {
    let viewController = SearchRoutesViewController()
    let interactor = DefaultSearchRoutesInteractor(
      service: dependency.service,
      listener: listener
    )
    let presenter = DefaultSearchRoutesPresenter(
      view: viewController,
      interactor: interactor
    )
    let router = DefaultSearchRoutesRouter(
      presenter: presenter,
      viewController: viewController
    )
    viewController.output = presenter
    interactor.output = presenter
    presenter.router = router
    return router
  }
}
