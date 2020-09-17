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
    @IBOutlet weak var priceLabel: UIButton!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var durationTimeLabel: UILabel!
    @IBOutlet weak var departureTerminalLabel: UILabel!
    @IBOutlet weak var arrivalTerminalLabel: UILabel!
    @IBOutlet weak var busCompanynameLabel: UILabel!
    @IBOutlet weak var nextDayLabel: UILabel!
    @IBOutlet weak var seatsAvailableImg: UIImageView!
    @IBOutlet weak var fac1Img: UIImageView!
    @IBOutlet weak var fac2Img: UIImageView!
    @IBOutlet weak var fac3Img: UIImageView!
    @IBOutlet weak var fac4Img: UIImageView!
    @IBOutlet var amenitiesImgViews: [UIImageView]!

    
    var cellData: DeparturesCellViewModel = DeparturesCellViewModel()
    
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
        priceLabel.setTitle(cellData.price, for: .normal)
        priceLabel.backgroundColor = AppColors.defult.yellowColor
        priceLabel.round(5)
        departureTimeLabel.text = cellData.departureTime
        arrivalTimeLabel.text = cellData.arrivalTime
        durationTimeLabel.text = cellData.durationTime
        departureTerminalLabel.text = cellData.departureTerminal
        arrivalTerminalLabel.text = cellData.arrivalTerminal
        busCompanynameLabel.text = cellData.busCompanyName
        nextDayLabel.isHidden = !cellData.isNextDay
        seatsAvailableImg.image = UIImage(systemName: "\(cellData.seatsAvailable).circle")
        
        setAmenities()
    }
    
    func setAmenities(){
        var amenitiesList:[String] = []
        
        if cellData.facilities.wifi {
            amenitiesList.append("wifi")
        }
        
        if cellData.facilities.ac {
            amenitiesList.append("fan")
        }
        
        if cellData.facilities.powerOutlets {
            amenitiesList.append("plug")
        }
        
        if cellData.facilities.food {
            amenitiesList.append("coffee")
        }

        for i in 0..<amenitiesList.count {
            amenitiesImgViews[i].image = UIImage(named: amenitiesList[i])
        }
        
    }
    
}
