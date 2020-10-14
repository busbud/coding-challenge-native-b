
import UIKit
import SnapKit

protocol OnboardView: AnyObject {
  func configure(with model: OnboardViewModel)
}

protocol OnboardViewOutput: AnyObject {
  func viewDidLoad()
  func viewWillAppear()
  func viewDidDisappear()
  func showSearchScreen()
}

final class OnboardViewController: UIViewController {

  weak var output: OnboardViewOutput?
  private var viewModel: OnboardViewModel = OnboardViewModel()
  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private let searchButton: UIButton = {
    let button = UIButton(frame: .zero)
    button.setTitleColor(.black, for: .normal)
    return button
  }()


  override func viewDidLoad() {
    super.viewDidLoad()
    setUpSubviews()
    setUpConstraints()
    output?.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    output?.viewWillAppear()
  }

  override func viewDidDisappear(_ animated: Bool) {
    output?.viewDidDisappear()
    super.viewDidDisappear(animated)
  }
}

private extension OnboardViewController {
  private func setUpSubviews() {
    view.backgroundColor = .white
    view.addSubview(searchButton)
    searchButton.setTitle(viewModel.buttonText, for: .normal)
    searchButton.addTarget(self, action: #selector(OnboardViewController.showSearchScreen), for: .touchUpInside)
  }

  private func setUpConstraints() {
    searchButton.snp.makeConstraints { make in
      make.center.equalTo(view.snp.center)
    }
  }

  @objc private func showSearchScreen() {
    output?.showSearchScreen()
  }
}

extension OnboardViewController: OnboardView {
  func configure(with model: OnboardViewModel) {

  }
}
