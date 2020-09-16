//
//  MainTabBar_VC.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/16/20.
//

import UIKit

class MainTabBar_VC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarItems()
        
    }
    
    func setTabBarItems(){
        
        self.tabBar.items?[0].title = ""
        self.tabBar.items?[1].title = ""
        self.tabBar.items?[2].title = ""
        self.tabBar.items?[3].title = ""

    }
    

}
