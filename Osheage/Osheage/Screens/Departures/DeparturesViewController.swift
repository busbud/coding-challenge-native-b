//
//  DeparturesViewController.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import UIKit
import SwiftMessages
import PKHUD

class DeparturesViewController: UIViewController {
    let viewModel: DeparturesViewModel
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.separatorInset = .zero
        tableView.isHidden = true
        return tableView
    }()
    
    private lazy var emptyStateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No departures("
        label.isHidden = true
        return label
    }()
    
    required init(viewModel: DeparturesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        viewModel.onFetchDepartures = { [weak self] isContentExists in
            HUD.hide()
            if isContentExists {
                self?.configureContentState()
                self?.tableView.reloadData()
            } else {
                self?.configureEmptyState()
            }
        }
        
        viewModel.onFetchDeparturesError = { [weak self] error in
            HUD.hide()
            let errorView = ErrorMessageView.with(description: error.localizedDescription)
            SwiftMessages.show(view: errorView)
            self?.configureEmptyState()
        }
        
        viewModel.fetchDepartures()
        HUD.show(.progress)
    }
}

extension DeparturesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.departuresVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DepartureTableCell.reuseIdentifier, for: indexPath) as? DepartureTableCell
        else { return UITableViewCell() }
        cell.viewModel = viewModel.departuresVMs[indexPath.row]
        return cell
    }
}

private extension DeparturesViewController {
    func configureUI() {
        title = "\(viewModel.originCity.name) - \(viewModel.destinationCity.name)"
        view.backgroundColor = .white
        configureLayout()
        regiesterCells()
    }
    
    func configureLayout() {
        view.addSubview(tableView)
        view.addSubview(emptyStateLabel)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyStateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyStateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func regiesterCells() {
        tableView.register(DepartureTableCell.nib, forCellReuseIdentifier: DepartureTableCell.reuseIdentifier)
    }
    
    func configureEmptyState() {
        tableView.isHidden = true
        emptyStateLabel.isHidden = false
    }
    
    func configureContentState() {
        emptyStateLabel.isHidden = true
        tableView.isHidden = false
        tableView.reloadData()
    }
}
