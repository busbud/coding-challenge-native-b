//
//  Welcom_VC.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/16/20.
//

import UIKit

class Welcom_VC: UIViewController {

    //IBOutlet & IBAction:
    @IBOutlet weak var signInBtn: UIButton!
    @IBAction func signInBtnAction(_ sender: UIButton) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cleanNavigationBar()
        setNavigationTitleLogo()
        
        setView()
    }
    
    
    
    func setView(){
        signInBtn.backgroundColor = AppColors.defult.yellowColor
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.round(5)
    }
    
    ///it will look like the navigation bar has disappeared.
    func cleanNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    
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

}

