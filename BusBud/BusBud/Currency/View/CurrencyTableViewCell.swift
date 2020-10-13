//
//  CurrencyTableViewCell.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    @IBOutlet private var currencyTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(currency: String) {
        currencyTitleLabel.text = currency
    }
}
