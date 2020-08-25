//
//  SearchViewController.swift
//  BusbudOsheaga
//
//  Created by José Rafael Rocha on 2020-08-24.
//  Copyright © 2020 José Rafael Rocha. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, View {

    var presenter = PresenterFactory.presenter(for: SearchViewController.self) as! SearchPresenterProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.searchItemsChanged = { searchResponse in
            print(searchResponse)
        }
        presenter.userStartedSearch()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
