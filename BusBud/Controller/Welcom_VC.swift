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
        openNextPage()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cleanNavigationBar()
        setNavigationTitleLogo()
        
        setView()
    }
    
    
    
    func setView(){
        signInBtn.backgroundColor = AppColors.defult.mainBlueColor
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
    
    

    
    
    func openNextPage(){
        
        guard let controller = self.storyboard?.instantiateViewController(identifier: "UserInfo_VCId") as? UserInfo_VC else {
            return
        }
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
    deinit {
        print("[deinit] Welcom_VC")
    }

}

