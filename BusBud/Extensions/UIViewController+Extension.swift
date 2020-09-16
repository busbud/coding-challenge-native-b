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
    
    
    // clean Back Text of navigation bar
    func cleanBackText(){
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
