//
//  CurrencySelectionViewController.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import UIKit

class CurrencySelectionViewController: UIViewController {
    @IBOutlet private var currencyTableView: UITableView!

    var viewModel: CurrencySelectionViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupTableView()
    }

    private func bindViewModel() {
        guard  let viewModel = viewModel else { return }
        let input = CurrencySelectionViewModel.CurrencySelectionViewModelInput(selectedIndex: currencyTableView.rx.itemSelected.map { [weak self] in
            self?.dismiss(animated: false, completion: nil)
            return $0.row
        })
        let output = viewModel.transform(input: input)
        _ = output.currencies.bind(to: currencyTableView.rx.items(cellIdentifier: "cell",
                                                                  cellType: CurrencyTableViewCell.self)) { _, currency, cell in
            cell.set(currency: currency)
        }
    }

    private func setupTableView() {
        currencyTableView.register(UINib(nibName: "CurrencyTableViewCell",
                                         bundle: Bundle(for: CurrencyTableViewCell.self)),
                                    forCellReuseIdentifier: "cell")
        currencyTableView.tableFooterView = UIView(frame: .zero)
    }
}

extension CurrencySelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
