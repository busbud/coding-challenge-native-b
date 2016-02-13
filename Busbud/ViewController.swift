//
//  ViewController.swift
//  Busbud
//
//  Created by Camille Kander on 2/12/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func search() {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .NoStyle
        
        Client.searchDepartures(origin: "dr5reg", destination: "f25dvk", outboundDate: NSDate(timeIntervalSince1970: 1469786400), adults: 1, currency: "USD",
            success: { departures in
                
                for departure in departures {
                    print(" - \(dateFormatter.stringFromDate(departure.departureTime)) -> \(dateFormatter.stringFromDate(departure.arrivalTime)) | \(departure.origin.name) -> \(departure.destination.name): $\(Double(departure.price) / 100.0) (\(departure.op.name))")
                }
                
            }, failure: { error in
                print(error.localizedDescription)
            }
        )
    }
}

