//
//  LanguageTableViewCell.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    @IBOutlet private var languageTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(lang: String) {
        languageTitleLabel.text = lang
    }
}
