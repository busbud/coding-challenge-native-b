//
//  ResultsViewController.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import UIKit
import Lottie
import Combine

class ResultsViewController: UIViewController {
    
    private var viewModel: ResultsViewModel
    private var searchResult: Response? {
        didSet {
            self.tableView.reloadData()
        }
    }
    private var subscriber: AnyCancellable?
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.registerNibForCell(ResultsItemViewCell.self)
        return tv
    }()
    
    private var loadingView = ResultsLoadingView()
    
    init(with viewModel: ResultsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        observeViewModel()
        
        viewModel.fetchResults()
    }

}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult?.departures?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: ResultsItemViewCell.self, forIndexPath: indexPath)
        cell.departureTime.text = searchResult?.departureTime(forItemAt: indexPath.row)
        cell.arrivalTime.text = searchResult?.arrivalTime(forItemAt: indexPath.row)
        cell.locationName.text = searchResult?.locationName(forItemAt: indexPath.row)
        cell.price.text = searchResult?.ticketPrice(forItemAt: indexPath.row)
        return cell
    }
}

private extension ResultsViewController {
    func setupView() {
        hero.isEnabled = true
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(tableView)
        view.addSubview(loadingView)
    }
    
    func setupConstraints() {
        loadingView.snp.makeConstraints { $0.margins.equalToSuperview() }
        tableView.snp.makeConstraints{ $0.margins.equalToSuperview() }
    }
    
    func observeViewModel() {
        subscriber = viewModel.responseSubject.sink { (resultCompletion) in
            switch resultCompletion {
            case .failure(let error):
                print(error)
            default: break
            }
        } receiveValue: { (response) in
            self.searchResult = response
        }
    }
}
