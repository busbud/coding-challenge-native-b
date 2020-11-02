//
//  GradientView.swift
//  Osheaga Routes Swift
//
//  Created by user on 01/11/20.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var leftColor: UIColor = UIColor.white
    @IBInspectable var rightColor: UIColor = UIColor.black

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        (layer as? CAGradientLayer)?.colors = [leftColor.cgColor, rightColor.cgColor]
        (layer as? CAGradientLayer)?.startPoint = CGPoint(x: 0, y: 0)
        (layer as? CAGradientLayer)?.endPoint = CGPoint(x: layer.bounds.width, y: 0)
    }
}
