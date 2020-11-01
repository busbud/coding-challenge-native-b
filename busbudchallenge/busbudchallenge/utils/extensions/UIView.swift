//
//  UIView.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import UIKit

extension UIView {
    func spring() {
        UIView.animate(withDuration: 0.15,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.1,
                       options: .curveEaseIn,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.3,
                                       delay: 0,
                                       usingSpringWithDamping: 0.3,
                                       initialSpringVelocity: 0.5,
                                       options: .curveEaseIn) {
                            self.transform = CGAffineTransform(scaleX: 1, y: 1)
                        }
                       })
    }
}
