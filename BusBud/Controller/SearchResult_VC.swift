//
//  SearchResult_VC.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/16/20.
//

import UIKit

class SearchResult_VC: UIViewController {

    // it has to be define as Lazy, other than that view will NOT de initialize
    lazy var titleView = Bundle.main.loadNibNamed("Title_View", owner:self, options: nil)?.first as? Title_View
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTitleView()
        addRightNavItem()
        
        
    }
    
    
    
    func addRightNavItem(){

        let rightItem = UIBarButtonItem(image: UIImage(named: "filter"), landscapeImagePhone: UIImage(named: "filter"), style: .plain, target: self, action: #selector(filterBtnAction))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    
    
    func setTitleView(){
    
        guard let titleView = self.titleView else {
            return
        }

        let titleData = TitleViewModel(departureName: "New York", arrivalName: "Boston", date: "21 Jul 2021")
        titleView.titleData = titleData
        titleView.initialize()
        self.navigationItem.titleView = titleView
    
    }


    @objc func filterBtnAction(){
        
    }

}
