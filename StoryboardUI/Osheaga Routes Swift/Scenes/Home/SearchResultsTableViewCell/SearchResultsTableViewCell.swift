//
//  SearchResultsTableViewCell.swift
//  Osheaga Routes Swift
//
//  Created by user on 02/11/20.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var departureArrivalLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
