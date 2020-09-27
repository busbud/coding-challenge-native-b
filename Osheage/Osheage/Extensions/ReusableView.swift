//
//  ReusableView.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return NSStringFromClass(Self.self)
    }
}

protocol NibView {
    static var nib: UINib { get }
}

extension NibView where Self: UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }
}
