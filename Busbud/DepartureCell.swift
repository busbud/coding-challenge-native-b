//
//  DepartureCell.swift
//  Busbud
//
//  Created by Camille Kander on 2/12/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import UIKit

class DepartureCell: UITableViewCell {
    
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var departureTimeLabel: UILabel!
    @IBOutlet private weak var arrivalTimeLabel: UILabel!
    @IBOutlet private weak var originLabel: UILabel!
    @IBOutlet private weak var destinationLabel: UILabel!
    
    
    let timeFormatter = BusbudFormatter.timeFormatter
    let priceFormatter = BusbudFormatter.priceFormatter
    
    var departure: Departure! {
        didSet {
            priceLabel.text = priceFormatter.stringFromNumber(Double(departure.price) / 100.00)
            operatorLabel.text = departure.op.name
            departureTimeLabel.text = timeFormatter.stringFromDate(departure.departureTime)
            arrivalTimeLabel.text = timeFormatter.stringFromDate(departure.arrivalTime)
            originLabel.text = departure.origin.name
            destinationLabel.text = departure.destination.name
        }
    }
}
