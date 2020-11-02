//
//  SearchResultsTableViewDataSource.swift
//  Osheaga Routes Swift
//
//  Created by user on 02/11/20.
//

import UIKit

protocol SearchResultsTableViewDataSourceDelegate: class {
    
    func getResultsCount() -> Int
    
    func getDeparture(at indexPath: IndexPath) -> Departure?
    func getLocation(with id: Int) -> Location?
    
}

class SearchResultsTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: SearchResultsTableViewDataSourceDelegate?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.getResultsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rawCell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        if let cell = rawCell as? SearchResultsTableViewCell {
           
            
            let departure = delegate?.getDeparture(at: indexPath)
            let location = delegate?.getLocation(with: departure?.originLocationId ?? 0)
            
            let price = String(format: "CA$%.02f", Float(departure?.prices.total ?? 0) / 100 )
            
            cell.departureArrivalLabel.text = departure?.departureArrivalReadable
            cell.placeLabel.text = location?.name
            cell.priceLabel.text = price
            
        }
        
        return rawCell
    }
}
