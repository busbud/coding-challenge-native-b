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
    let dateFormatter = BusbudFomatter.timeFormatter
    
    @IBAction func search() {
        
        Client.searchDepartures(origin: "dr5reg", destination: "f25dvk", outboundDate: NSDate(timeIntervalSince1970: 1469786400), adults: 1, currency: "USD",
            success: { departures in
                
                for departure in departures {
                    print(" - \(self.dateFormatter.stringFromDate(departure.departureTime)) -> \(self.dateFormatter.stringFromDate(departure.arrivalTime)) | \(departure.origin.name) -> \(departure.destination.name): $\(Double(departure.price) / 100.0) (\(departure.op.name))")
                }
                
                self.departures = departures
                self.tableView.reloadData()
                
            }, failure: { error in
                print(error.localizedDescription)
            }
        )
    }
    
    // MARK - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departures.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DepartureCell", forIndexPath: indexPath) as! DepartureCell
        
        cell.departure = departures[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
//        let cell = cell as! DepartureCell
    }
}
