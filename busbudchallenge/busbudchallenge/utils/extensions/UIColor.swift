//
//  UIColor.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit

extension UIColor {
    
    convenience init(rgb: UInt) {
           self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
    
    static var corporateYellow: UIColor {
        return UIColor(rgb: 0xffe454)
    }
    
    static var corporatePink: UIColor {
        return UIColor(rgb: 0xaa206b)
    }
}
