//
//  SearchViewController.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-08.
//

import RxCocoa
import RxSwift
import UIKit

class SearchViewController: UIViewController {
    @IBOutlet private var adultNumberLabel: UILabel!
    @IBOutlet private var seniorNumberLabel: UILabel!
    @IBOutlet private var childNumberLabel: UILabel!
    @IBOutlet private var langButton: UIButton!
    @IBOutlet private var currencyButton: UIButton!

    @IBOutlet private var adultStepper: UIStepper!
    @IBOutlet private var seniorStepper: UIStepper!
    @IBOutlet private var childStepper: UIStepper!

    @IBOutlet private var searchResultTableView: UITableView!
    @IBOutlet private var searchButton: UIButton!
    @IBOutlet private var loadingActivity: UIActivityIndicatorView!

    var viewModel: SearchViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
    }

    private func bindViewModel() {
        guard  let viewModel = viewModel else { return }
        let input = SearchViewModel.SearchViewModelInput(search: searchButton.rx.tap.asObservable(),
                                                         selectLang: langButton.rx.tap.asObservable(),
                                                         selectCurrency: currencyButton.rx.tap.asObservable(),
                                                         selectAdult: adultStepper.rx.value.map { Int($0) },
                                                         selectChild: childStepper.rx.value.map { Int($0) },
                                                         selectSenior: seniorStepper.rx.value.map { Int($0) })

        let output = viewModel.transform(input: input)
        _ = output.waitingMode.drive(onNext: {[weak self] waitingMode in
            self?.waitingMode(loading: waitingMode)
        })
        _ = output.adult.drive(adultNumberLabel.rx.text)
        _ = output.child.drive(childNumberLabel.rx.text)
        _ = output.senior.drive(seniorNumberLabel.rx.text)
        _ = output.lang.drive(langButton.rx.title(for: .normal))
        _ = output.currency.drive(currencyButton.rx.title(for: .normal))
        _ = output.searchResult.bind(to: searchResultTableView.rx.items(cellIdentifier: "cell",
                                                                        cellType: SearchResultTableViewCell.self)) { _, result, cell in
            cell.set(result: result)
        }
        _ = output.waitingMode.drive(onNext: {[weak self] waitingMode in
            self?.waitingMode(loading: waitingMode)
        })
    }

    private func setupTableView() {
        searchResultTableView.register(UINib(nibName: "SearchResultTableViewCell",
                                             bundle: Bundle(for: SearchResultTableViewCell.self)),
                                    forCellReuseIdentifier: "cell")
        searchResultTableView.tableFooterView = UIView(frame: .zero)
    }

    private func waitingMode(loading: Bool) {
        loadingActivity.isHidden = !loading
        searchButton.isEnabled = !loading
        searchButton.alpha = loading ? 0.5 : 1.0
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
