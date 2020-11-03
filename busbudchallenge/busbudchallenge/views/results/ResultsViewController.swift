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
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

private extension ResultsViewController {
    func setupView() {
        hero.isEnabled = true
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(loadingView)
        view.addSubview(tableView)
        tableView.isHidden = true
    }
    
    func setupConstraints() {
        loadingView.snp.makeConstraints { $0.margins.equalToSuperview() }
        tableView.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(10)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    func observeViewModel() {
        subscriber = viewModel.responseSubject.sink { (resultCompletion) in
            switch resultCompletion {
            case .failure(let error):
                print(error)
            default: break
            }
        } receiveValue: { (response) in
            DispatchQueue.main.async {
                self.loadingView.isHidden = true
                self.tableView.isHidden = false
                self.searchResult = response
            }
        }
    }
}
