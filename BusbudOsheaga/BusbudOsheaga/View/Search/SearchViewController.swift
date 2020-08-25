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
    
    var items = [SearchItem]()
    @IBOutlet var collectionView: UICollectionView?
    @IBOutlet var loadingView: UIView?
    @IBOutlet var noTicketsView: UIView?
    @IBOutlet var lblHeader: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        presenter.searchItemsChanged = { searchItems in
            print(searchItems)
            self.items = searchItems
            self.collectionView?.reloadData()
        }
        
        presenter.isLoadingResults = { [weak self] isLoading in
            self?.loadingView?.isHidden = !isLoading
            if let itemsCount = self?.items.count {
                self?.noTicketsView?.isHidden = isLoading || itemsCount > 0
            }
        }
        
        presenter.headerChanged = { [weak self] text in
            self?.lblHeader?.text = text
        }
        
        presenter.displayAlert = { [weak self] error in
            let alert = UIAlertController(title: error.title, message: error.content, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self?.present(alert, animated: true)
        }
        presenter.userStartedSearch()
    }

}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count > 0 ? 1 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as? SearchCollectionViewCell {
            let item = items[indexPath.row]
            cell.lblName?.text = item.name
            cell.lblPrice?.text = item.price
            cell.lblTime?.text = item.times
            cell.roundedView?.layer.masksToBounds = true
            cell.roundedView?.layer.cornerRadius = 5.0
            return cell
        }
        return UICollectionViewCell()
    }

}
