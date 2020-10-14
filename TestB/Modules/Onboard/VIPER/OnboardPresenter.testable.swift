

import Foundation

final class DefaultOnboardPresenter {

  private let view: OnboardView
  private let interactor: OnboardInteractor
  weak var router: OnboardRouter?
  private var viewModel = OnboardViewModel()

  init(view: OnboardView,
       interactor: OnboardInteractor) {
    self.view = view
    self.interactor = interactor
  }
}

extension DefaultOnboardPresenter: OnboardViewOutput {
  func viewDidLoad() {}
  func viewWillAppear() {
  }
  func viewDidDisappear() {}
  func showSearchScreen() {
    router?.showSearchScreen()
  }
}

extension DefaultOnboardPresenter: OnboardInteractorOutput {
}
