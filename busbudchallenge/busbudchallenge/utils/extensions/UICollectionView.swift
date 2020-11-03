//
//  UICollectionView.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit

extension UICollectionView {
    func registerNibForCell<T: UICollectionViewCell>(_ cellClass: T.Type) {
        register(cellClass.self, forCellWithReuseIdentifier: String(describing: cellClass.self))
    }
    
    func dequeue<T: UICollectionViewCell>(cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: cellClass.self), for: indexPath) as? T else {
            fatalError("Error: cell with id: \(String(describing: cellClass)) for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}

extension UITableView {
    func registerNibForCell<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass.self, forCellReuseIdentifier: String(describing: cellClass.self))
    }
    
    func dequeue<T: UITableViewCell>(cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellClass.self), for: indexPath) as? T else {
            fatalError("Error: cell with id: \(String(describing: cellClass)) for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}
