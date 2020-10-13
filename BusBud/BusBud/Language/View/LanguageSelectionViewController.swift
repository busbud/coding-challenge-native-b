//
//  LanguageSelectionViewController.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import UIKit

class LanguageSelectionViewController: UIViewController {
    @IBOutlet private var languageTableView: UITableView!
    var viewModel: LanguageSelectionViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
    }

    private func bindViewModel() {
        guard  let viewModel = viewModel else { return }
        let input = LanguageSelectionViewModel.LanguageSelectionViewModelInput(selectedIndex: languageTableView.rx.itemSelected.map { [weak self] in
            self?.dismiss(animated: false, completion: nil)
            return $0.row
        })
        let output = viewModel.transform(input: input)
        _ = output.languages.bind(to: languageTableView.rx.items(cellIdentifier: "cell",
                                                                 cellType: LanguageTableViewCell.self)) { _, lang, cell in
            cell.set(lang: lang)
        }
    }

    private func setupTableView() {
        languageTableView.register(UINib(nibName: "LanguageTableViewCell",
                                         bundle: Bundle(for: LanguageTableViewCell.self)),
                                   forCellReuseIdentifier: "cell")
        languageTableView.tableFooterView = UIView(frame: .zero)
    }
}

extension LanguageSelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
