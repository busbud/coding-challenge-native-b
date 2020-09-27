//
//  DepartureTableCell.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import UIKit

class DepartureTableCell: UITableViewCell {
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var departureTimeLabel: UILabel!
    @IBOutlet private var departureCityLabel: UILabel!
    @IBOutlet private var arrivalTimeLabel: UILabel!
    @IBOutlet private var arrivalCityLabel: UILabel!
    @IBOutlet private var locationNameLabel: UILabel!
    
    var viewModel: DepartureTableCellVM? {
        didSet {
            guard let vm = viewModel else { return }
            priceLabel.text = vm.priceTitle
            departureTimeLabel.text = vm.departureTimeTitle
            departureCityLabel.text = vm.departureCityTitle
            arrivalTimeLabel.text = vm.arrivalTimeTitle
            arrivalCityLabel.text = vm.arrivalCityTitle
            locationNameLabel.text = vm.locationNameTitle
        }
    }
}

extension DepartureTableCell: ReusableView { }
extension DepartureTableCell: NibView { }
