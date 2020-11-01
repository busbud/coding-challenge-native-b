//
//  UIFont.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit

extension UIFont {
    
    static func helvetica(ofSize size: CGFloat) -> UIFont {
        return self.init(name: "HelveticaNeue", size: size) ?? systemFont(ofSize: size)
    }
    
    static func helveticaBold(ofSize size: CGFloat) -> UIFont {
        return self.init(name: "HelveticaNeue-Bold", size: size) ?? systemFont(ofSize: size)
    }
    
}

