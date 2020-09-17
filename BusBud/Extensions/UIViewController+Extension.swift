//
//  UIViewController+Extension.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/16/20.
//

import Foundation
import UIKit



extension UIViewController {
    
    
    //Set navigation Title View
    func setNavigationTitleLogo(){
        var titleImgView: UIImageView {
            let view = UIImageView()
            view.image = UIImage(named: "busbudLogo_Small_tr")
            view.contentMode = .scaleAspectFill
            view.clipsToBounds = true
            return view
        }
        
        self.navigationItem.titleView = titleImgView
    }
    
    
    //it will look like the navigation bar has disappeared.
    func cleanNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = UIColor.label
        cleanBackText()
    }
    
    
    // clean Back Text of navigation bar
    func cleanBackText(){
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        let backImage = UIImage(named: "backArrow")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
    }
}
