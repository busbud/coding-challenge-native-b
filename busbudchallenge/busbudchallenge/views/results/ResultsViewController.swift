//
//  ResultsViewController.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import UIKit
import Lottie

class ResultsViewController: UIViewController {
    
    private var viewModel: ResultsViewModel
    
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
        setupContent()
    }

}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return -1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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
    }
    
    func setupContent() {
        
    }
}
