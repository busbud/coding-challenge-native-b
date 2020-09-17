//
//  SearchResultCell.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import UIKit
import Foundation

class SearchResultCell: UITableViewCell {

    static var cellIdentifier:String {
            return "searchResultCell"
    }
    
    static func registerNib() -> UINib {
        return UINib(nibName: "SearchResultCell", bundle: nil)
    }
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var durationTimeLabel: UILabel!
    @IBOutlet weak var departureTerminalLabel: UILabel!
    @IBOutlet weak var arrivalTerminalLabel: UILabel!
    @IBOutlet weak var busCompanynameLabel: UILabel!
    @IBOutlet weak var seatsAvailableImg: UIImageView!
    @IBOutlet weak var fac1Img: UIImageView!
    @IBOutlet weak var fac2Img: UIImageView!
    @IBOutlet weak var fac3Img: UIImageView!
    @IBOutlet weak var fac4Img: UIImageView!

    
    var cellData: TicketCellViewModel = TicketCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.round(10)
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(){
        dateLabel.text = cellData.date
        priceLabel.text = cellData.price
        departureTimeLabel.text = cellData.departureTime
        arrivalTimeLabel.text = cellData.arrivalTime
       // durationTimeLabel.text = cellData.
        departureTerminalLabel.text = cellData.departureTerminal
        arrivalTerminalLabel.text = cellData.arrivalTerminal
        busCompanynameLabel.text = cellData.busCompanyName
    }
    
}
