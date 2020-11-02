//
//  BookingTableViewController.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import UIKit

protocol BookingViewDelegate {
    func onSearchButtonTapped(_ sections: Sections)
}

class BookingView: UIView {
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.bounces = false
        tv.registerNibForCell(BookingItemViewCell.self)
        tv.tableFooterView = UIView()
        return tv
    }()
    
    private lazy var searchButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 10
        btn.isUserInteractionEnabled = true
        btn.backgroundColor = .corporateYellow
        btn.setTitle(K.Strings.search, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.isUserInteractionEnabled = true
        btn.addTarget(self, action: #selector(onSearchButtonPressed), for: .touchUpInside)
        
        btn.hero.id = "bouncingdot"
        return btn
    }()
    
    var delegate: BookingViewDelegate?
    var searchItems = Sections.items
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookingView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchItems.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchItems.numberOfRows(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: BookingItemViewCell.self, forIndexPath: indexPath)
        cell.titleLabel.text = searchItems.getTitle(for: indexPath.row, in: indexPath.section)
        cell.descriptionLabel.text = searchItems.getDescription(for: indexPath.row, in: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
}

private extension BookingView {
    func setupView() {
        addSubview(tableView)
        addSubview(searchButton)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(286)
        }
        searchButton.snp.makeConstraints {
            $0.leading.bottom.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(60)
        }
    }
    
    @objc func onSearchButtonPressed() {
        guard let delegate = delegate else {
            print("BookingViewDelegate not set yet")
            return
        }
        delegate.onSearchButtonTapped(searchItems)
    }
}
