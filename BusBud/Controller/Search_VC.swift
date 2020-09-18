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
        openSearch()
    }
    
    var searchModelData:SearchModel = SearchModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        cleanNavigationBar()
        setNavigationTitleLogo()
        
        setView()
        
    }
    
    
    func setView(){
        searchBtn.backgroundColor = AppColors.defult.yellowColor
        searchBtn.setTitleColor(.white, for: .normal)
        searchBtn.round(5)
        
        searchParamsView.round(5)
        
        helloLabel.text = "Hello \(Global_Variables.userName),"
        
    }
    
    
    func openSearch(){
        
        getFakeSearchParams()
        
        guard let controller = self.storyboard?.instantiateViewController(identifier: "SearchResult_VCId") as? SearchResult_VC else {
            return
        }
        
        controller.searchModelData = self.searchModelData
        self.navigationController?.pushViewController(controller, animated: true)
        
    }

    func getFakeSearchParams() {

        //New York -> Boston
        searchModelData = SearchModel(
            departureGeoHash: "dr5reg",
            departureName: "New York",
            arrivalGeoHash: "drt2yz",
            arrivalName: "Boston",
            adult: "1",
            date: "2021-07-29",
            child: "",
            senior: "",
            lang: "US",
            currency: "USD")
        
        
        
        /*
         // Boston -> Washington
        searchModelData = SearchModel(
            departureGeoHash: "drt2yz",
            departureName: "Boston",
            arrivalGeoHash: "dqcjqb",
            arrivalName: "Washington",
            adult: "1",
            date: "2021-07-29",
            child: "",
            senior: "",
            lang: "US",
            currency: "USD")
 
         */
    }

    
    
    
}

