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
    
    func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
            UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
                self.alpha = 1.0
            }, completion: completion)
        }

        func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 3.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
            UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
                self.alpha = 0.0
            }, completion: completion)
        }
}
