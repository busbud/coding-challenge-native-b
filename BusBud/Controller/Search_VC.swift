//
//  Search_VC.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/16/20.
//

import UIKit

class Search_VC: UIViewController {

    
    
    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var searchParamsView: UIView!
    
    @IBOutlet weak var searchBtn: UIButton!
    @IBAction func searchBtnAction(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        cleanNavigationBar()
        setNavigationTitleLogo()
        
        setView()
    }
    
    
    func setView(){
        searchBtn.backgroundColor = AppColors.defult.mainBlueColor
        searchBtn.setTitleColor(.white, for: .normal)
        searchBtn.round(5)
        
        searchParamsView.round(5)
        
        helloLabel.text = "Hello \(Global_Variables.userName),"
        
    }


}
