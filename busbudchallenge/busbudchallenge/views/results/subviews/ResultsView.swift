//
//  ResultsTableView.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 3/11/20.
//

import UIKit
import Lottie

class ResultsView: UIView {
    private var headerView: AnimationView = {
        let av = AnimationView(name: "city-background")
        av.loopMode = .loop
        return av
    }()
    
    private var routeLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helveticaBold(ofSize: 12)
        lbl.textColor = .gray
        return lbl
    }()
    
    private var dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helveticaBold(ofSize: 12)
        lbl.textColor = .gray
        return lbl
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.registerNibForCell(ResultsTableViewCell.self)
        tv.tableFooterView = UIView()
        tv.bounces = false
        tv.isUserInteractionEnabled = false
        return tv
    }()
    
    var data: Response? {
        didSet {
            tableView.reloadData()
            setupHeaderContent()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ResultsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.departures?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: ResultsTableViewCell.self, forIndexPath: indexPath)
        guard let data = data, let departures = data.departures else { return cell }
        
        var departure = departures[indexPath.row]
        departure.operators = data.operators
        departure.locations = data.locations
        departure.cities = data.cities
        
        cell.item = departure
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

private extension ResultsView {
    func setupView() {
        addSubview(headerView)
        addSubview(routeLabel)
        addSubview(dateLabel)
        addSubview(tableView)
        headerView.play()
    }
    
    func setupConstraints() {
        headerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(330)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom).inset(40)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        routeLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(tableView.snp.top).offset(-5)
            make.leading.equalToSuperview().offset(20)
        }
        dateLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(tableView.snp.top).offset(-5)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func setupHeaderContent() {
        guard let originName = data?.cities?.first?.name,
              let destinationName = data?.cities?.last?.name,
              let departureDate = data?.departures?.first?.departureDateTime
        else { return }
        routeLabel.text = originName + " \u{2794} " + destinationName
        dateLabel.text = Date.from(string: departureDate, with: .iso8061).toString(with: .usStyle)
    }
}
