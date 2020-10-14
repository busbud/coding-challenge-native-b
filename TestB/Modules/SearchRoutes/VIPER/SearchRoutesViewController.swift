

import UIKit
import SnapKit

protocol SearchRoutesView: AnyObject {
  func configure(with model: SearchRoutesViewModel)
}

protocol SearchRoutesViewOutput: AnyObject {
  func viewDidLoad()
  func viewWillAppear()
  func viewDidDisappear()
  func backToOnboarding()
}

final class SearchRoutesViewController: UIViewController {

  weak var output: SearchRoutesViewOutput?
  private var viewModel: SearchRoutesViewModel = SearchRoutesViewModel()
  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private let tableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.estimatedRowHeight = 50
    tableView.rowHeight = UITableView.automaticDimension
    tableView.allowsSelection = false
    return tableView
  }()

  private let backButton: UIButton = {
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

private extension SearchRoutesViewController {
  private func setUpSubviews() {
    view.backgroundColor = .white
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(DepartureCell.self,
                       forCellReuseIdentifier: DepartureCell.typeName)

    view.addSubview(backButton)
    backButton.setTitle(viewModel.backButtonText, for: .normal)
    backButton.addTarget(self, action: #selector(SearchRoutesViewController.backToOnboarding), for: .touchUpInside)
  }

  private enum Constants {
    static let tableViewBottomInset = 24
    static let backButtonTopOffset = 8
  }

  private func setUpConstraints() {
    tableView.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(view)
      make.bottom.equalTo(view.snp.bottomMargin).inset(Constants.tableViewBottomInset)
    }
    backButton.snp.makeConstraints { make in
      make.top.equalTo(tableView.snp.bottom).offset(Constants.backButtonTopOffset)
      make.centerX.equalTo(view.snp.centerX)
      make.bottom.equalTo(view.snp.bottomMargin)
    }
  }

  @objc private func backToOnboarding() {
    output?.backToOnboarding()
  }}

extension SearchRoutesViewController: SearchRoutesView {
}

extension SearchRoutesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.departures.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: DepartureCell.typeName,
                                                   for: indexPath) as? DepartureCell
      else { return UITableViewCell() }

    cell.update(with: viewModel.departures[indexPath.row])
    return cell
  }


}

extension SearchRoutesViewController: UITableViewDelegate {
  func configure(with model: SearchRoutesViewModel) {
    viewModel = model
    tableView.reloadData()
  }
}
