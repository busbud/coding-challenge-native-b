//
//  BookingItemViewCell.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import UIKit

class BookingTableViewCell: UITableViewCell {
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helveticaBold(ofSize: 10)
        lbl.textColor = .lightGray
        return lbl
    }()
    
    var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helvetica(ofSize: 14)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    var iconImage: UIImageView = {
        let iv = UIImageView()
        let ic = UIImage.SymbolConfiguration(pointSize: 13, weight: .medium)
        iv.image = UIImage(systemName: K.Identifiers.icRight, withConfiguration: ic)
        iv.tintColor = .lightGray
        iv.contentMode = .scaleAspectFit
        return iv
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

private extension BookingTableViewCell {
    func setupView() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(iconImage)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(10)
            $0.leading.equalTo(20)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.bottom.equalTo(-10)
        }
        iconImage.snp.makeConstraints {
            $0.trailing.equalTo(-20)
            $0.centerY.equalTo(snp.centerY)
        }
    }
}
