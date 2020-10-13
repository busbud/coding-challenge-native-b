//
//  SearchResultTableViewCell.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-09.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    @IBOutlet private var departureTimeLabel: UILabel!
    @IBOutlet private var arrivalTimeLabel: UILabel!
    @IBOutlet private var locationLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(result: SearchResultViewData) {
        departureTimeLabel.text = result.departureTime
        arrivalTimeLabel.text = result.arrivalTime
        locationLabel.text = result.locationName
        priceLabel.text = result.price
    }
}
