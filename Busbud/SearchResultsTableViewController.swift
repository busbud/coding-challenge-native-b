//
//  SearchResultsTableViewController.swift
//  Busbud
//
//  Created by Camille Kander on 2/12/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    
    var departures: [Departure] = []
    var currency: Currency = .USD
    
    // MARK - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departures.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DepartureCell", forIndexPath: indexPath) as! DepartureCell
        
        cell.currency = self.currency
        cell.departure = departures[indexPath.row]
        
        return cell
    }
}
