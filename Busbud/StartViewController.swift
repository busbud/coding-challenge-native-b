//
//  StartViewController.swift
//  Busbud
//
//  Created by Camille Kander on 2/12/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import UIKit
import MBProgressHUD

class StartViewController: UIViewController {

    private var departures: [Departure] = []
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private weak var currencyButton: UIBarButtonItem!
    private var departureDate = NSDate(timeIntervalSince1970: 1469786400)
    private var currency: Currency = .USD {
        didSet {
            currencyButton.title = currency.rawValue
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.date = departureDate
        datePicker.datePickerMode = .Date
        datePicker.addTarget(self, action: "datePickerDidChange:", forControlEvents: .ValueChanged)
        dateTextField.inputView = datePicker
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        toolbar.setItems([UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: ""), UIBarButtonItem(barButtonSystemItem: .Done, target: dateTextField, action: "resignFirstResponder")], animated: false)
        dateTextField.inputAccessoryView = toolbar
        
        datePickerDidChange(datePicker)
    }
    
    func datePickerDidChange(sender: UIDatePicker) {
        
        let dateFormatter = BusbudFormatter.departureDateFormatter
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
        departureDate = sender.date
    }
    
    @IBAction func search(sender: AnyObject?) {
        
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        
        Client.searchDepartures(origin: "dr5reg", destination: "f25dvk", outboundDate: departureDate, adults: 1, currency: currency,
            success: { departures in
                
                hud.hide(true)
                let dateFormatter = BusbudFormatter.timeFormatter
                let priceFormatter = BusbudFormatter.priceFormatter
                priceFormatter.currencySymbol = self.currency.symbol
                
                for departure in departures {
                    print(" - \(dateFormatter.stringFromDate(departure.departureTime)) -> \(dateFormatter.stringFromDate(departure.arrivalTime)) | \(departure.origin.name) -> \(departure.destination.name): \(priceFormatter.stringFromNumber(Double(departure.price) / 100.0)) (\(departure.op.name))")
                }
                
                self.departures = departures
                self.performSegueWithIdentifier("ShowSearchResults", sender: sender)
                
            }, failure: { error in
                hud.hide(true)
                print(error.localizedDescription)
            }
        )
    }
    
    @IBAction func showCurrencyPicker(sender: AnyObject?) {
        
        let currencyPickerController = UIAlertController(title: "Currency", message: nil, preferredStyle: .ActionSheet)
        
        for currency in [Currency.USD, .CAD, .EUR, .GBP] {
            currencyPickerController.addAction(UIAlertAction(title: currency.rawValue, style: .Default, handler: { (action) -> Void in
                self.currency = currency
            }))
        }
        
        currencyPickerController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        presentViewController(currencyPickerController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard let srtvc = segue.destinationViewController as? SearchResultsTableViewController else {
            return
        }
        
        srtvc.currency = self.currency
        srtvc.departures = self.departures
    }
}
