//
//  ResultItemCellView.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import UIKit

protocol ResultViewItem {
    var operatorLogo: String { get }
    var operatorName: String { get }
    
    var departureTime: String { get }
    var departureLocation: String { get }
    
    var arrivalTime: String { get }
    var arrivalLocation: String { get }
    
    var ticketPrice: String { get }
    var currencySymbol: String { get }
}

class ResultsItemViewCell: UITableViewCell {
    
    private var logoSize: CGFloat = 60
    
    var operatorLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .lightGray
        iv.layer.cornerRadius = 30
        return iv
    }()
    
    var operatorName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helvetica(ofSize: 12)
        lbl.textColor = .lightGray
        return lbl
    }()
    
    var departureTime: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helveticaBold(ofSize: 16)
        lbl.textColor = .systemBlue
        return lbl
    }()
    
    var arrivalTime: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helveticaBold(ofSize: 14)
        lbl.textColor = .lightGray
        return lbl
    }()
    
    var departureLocationName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helvetica(ofSize: 12)
        lbl.textColor = .systemBlue
        return lbl
    }()
    
    var arrivalLocationName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helvetica(ofSize: 12)
        lbl.textColor = .lightGray
        return lbl
    }()
    
    var currencySymbol: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helveticaBold(ofSize: 18)
        lbl.textColor = .systemBlue
        return lbl
    }()
    
    var price: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helveticaBold(ofSize: 18)
        lbl.textColor = .systemBlue
        return lbl
    }()
    
    var separatorView: UIView = {
        let vw = UIView()
        vw.backgroundColor = .lightGray
        return vw
    }()
    
    var item: ResultViewItem? {
        didSet {
            setupContent()
        }
    }
    
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
        addSubview(operatorLogo)
        addSubview(operatorName)
        addSubview(departureTime)
        addSubview(departureLocationName)
        addSubview(arrivalTime)
        addSubview(arrivalLocationName)
        addSubview(currencySymbol)
        addSubview(price)
        addSubview(separatorView)
    }
    
    func setupConstraints() {
        operatorLogo.snp.makeConstraints { make in
            make.width.height.equalTo(logoSize)
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalTo(snp.centerY)
        }
        departureTime.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalTo(operatorLogo.snp.trailing).offset(8)
        }
        departureLocationName.snp.makeConstraints { make in
            make.top.equalTo(departureTime.snp.top)
            make.leading.equalTo(departureTime.snp.trailing).offset(8)
            make.centerY.equalTo(departureTime.snp.centerY)
        }
        arrivalTime.snp.makeConstraints { make in
            make.top.equalTo(departureTime.snp.bottom).offset(8)
            make.leading.equalTo(departureTime.snp.leading)
        }
        arrivalLocationName.snp.makeConstraints { make in
            make.top.equalTo(arrivalTime.snp.top)
            make.leading.equalTo(departureTime.snp.trailing).offset(8)
            make.centerY.equalTo(arrivalTime.snp.centerY)
        }
        price.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview().offset(-10)
        }
        currencySymbol.snp.makeConstraints { (make) in
            make.trailing.equalTo(price.snp.leading).offset(-8)
            make.centerY.equalTo(price.snp.centerY)
        }
        separatorView.snp.makeConstraints { (make) in
            make.height.equalTo(0.2)
            make.leading.equalTo(departureTime.snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.top.equalTo(arrivalTime.snp.bottom).offset(10)
        }
        operatorName.snp.makeConstraints { (make) in
            make.leading.equalTo(operatorLogo.snp.trailing).offset(10)
            make.top.equalTo(separatorView.snp.bottom).offset(1)
        }
    }
    
    func setupContent() {
        guard let item = item else { return }
        operatorLogo.downloaded(from: item.operatorLogo)
        operatorName.text = item.operatorName
        departureTime.text = item.departureTime
        departureLocationName.text = item.departureLocation
        arrivalTime.text = item.arrivalTime
        arrivalLocationName.text = item.arrivalLocation
        currencySymbol.text = item.currencySymbol
        price.text = item.ticketPrice
    }
}



