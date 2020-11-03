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
            tableView.reloadData()
        }
    }
    private var subscriber: AnyCancellable?
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.isHidden = true
        tv.registerNibForCell(ResultsItemViewCell.self)
        return tv
    }()
    
    private lazy var noResultsView: ResultsEmptyView = {
        let re = ResultsEmptyView()
        re.delegate = self
        re.backgroundColor = .systemGroupedBackground
        re.alpha = 0
        return re
    }()
    
    private var loadingView: ResultsLoadingView = {
        let rlv = ResultsLoadingView()
        rlv.hero.isEnabled = true
        rlv.backgroundColor = .systemGroupedBackground
        return rlv
    }()
    
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

extension ResultsViewController: ResultsEmptyViewDelegate {
    func onTryAgainButtonPressed() {
        viewModel.fetchResults()
        loadingView.alpha = 1
        noResultsView.alpha = 0
    }
}

private extension ResultsViewController {
    func setupView() {
        hero.isEnabled = true
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(tableView)
        view.addSubview(loadingView)
        view.addSubview(noResultsView)
    }
    
    func setupConstraints() {
        loadingView.snp.makeConstraints { $0.margins.equalToSuperview() }
        noResultsView.snp.makeConstraints { $0.margins.equalToSuperview() }
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
            self.searchResult = response
            self.animateViews()
        }
    }
    
    func animateViews() {
        UIView.animate(withDuration: 0.5, delay: 2) { [weak self] in
            self?.loadingView.alpha = 0
        } completion: { [weak self] _ in
            let needsReload = (self?.searchResult?.departures?.count ?? 0) > 0
           
            if needsReload {
                self?.tableView.reloadData()
                self?.tableView.isHidden = false
            } else {
                self?.tableView.isHidden = true
                UIView.animate(withDuration: 0.2) { self?.noResultsView.alpha = 1 }
            }            
        }
    }
}
