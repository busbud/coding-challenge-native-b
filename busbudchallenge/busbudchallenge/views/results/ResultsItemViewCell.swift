//
//  ResultItemCellView.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import UIKit

protocol ResultViewItem {
    func departureTime(forItemAt index: Int) -> String
    func arrivalTime(forItemAt index: Int) -> String
    func locationName(forItemAt index: Int) -> String
    func ticketPrice(forItemAt index: Int) -> String
}

class ResultsItemViewCell: UITableViewCell {
    
    var departureTime: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helvetica(ofSize: 16)
        lbl.textColor = .systemGray
        return lbl
    }()
    
    var arrivalTime: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helvetica(ofSize: 16)
        lbl.textColor = .systemGray
        return lbl
    }()
    
    var locationName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helvetica(ofSize: 16)
        lbl.textColor = .systemGray
        return lbl
    }()
    
    var price: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helvetica(ofSize: 16)
        lbl.textColor = .systemGray
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension ResultsItemViewCell {
    func setupView() {
        addSubview(departureTime)
        addSubview(arrivalTime)
        addSubview(locationName)
        addSubview(price)
    }
    func setupConstraints() {
        departureTime.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(20)
        }
        arrivalTime.snp.makeConstraints {
            $0.top.equalTo(departureTime.snp.bottom).offset(10)
            $0.leading.equalTo(departureTime.snp.leading)
        }
        locationName.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(20)
        }
        price.snp.makeConstraints {
            $0.top.equalTo(locationName.snp.bottom).offset(10)
            $0.trailing.equalTo(locationName.snp.trailing)
        }
    }
}



