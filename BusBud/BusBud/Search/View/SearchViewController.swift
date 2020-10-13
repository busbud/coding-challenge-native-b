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
    
    private let disposeBag = DisposeBag()

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
        output.waitingMode.drive(onNext: {[weak self] waitingMode in
            self?.waitingMode(loading: waitingMode)
        }).disposed(by: disposeBag)
        output.adult.drive(adultNumberLabel.rx.text).disposed(by: disposeBag)
        output.child.drive(childNumberLabel.rx.text).disposed(by: disposeBag)
        output.senior.drive(seniorNumberLabel.rx.text).disposed(by: disposeBag)
        output.lang.drive(langButton.rx.title(for: .normal)).disposed(by: disposeBag)
        output.currency.drive(currencyButton.rx.title(for: .normal)).disposed(by: disposeBag)
        output.searchResult.bind(to: searchResultTableView.rx.items(cellIdentifier: "cell",
                                                                    cellType: SearchResultTableViewCell.self)) { _, result, cell in
            cell.set(result: result)
        }.disposed(by: disposeBag)
        output.waitingMode.drive(onNext: {[weak self] waitingMode in
            self?.waitingMode(loading: waitingMode)
        }).disposed(by: disposeBag)
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
