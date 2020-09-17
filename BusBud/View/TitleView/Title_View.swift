//
//  Title_View.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import UIKit

class Title_View: UIView {

    
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var titleData: TitleViewModel = TitleViewModel()
    
    override class func awakeFromNib() {
        self.initialize()
    }

    func initialize(){
        self.setView()
    }
    
    private func setView(){
        departureLabel.text = titleData.departureName
        arrivalLabel.text = titleData.arrivalName
        dateLabel.text = titleData.date
    }
}
