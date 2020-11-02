//
//  UIButton.swift
//  Osheaga Routes Swift
//
//  Created by user on 01/11/20.
//

import UIKit

@IBDesignable class GradientButton: UIButton {
    
    @IBInspectable var leftColor: UIColor = UIColor.white {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var rightColor: UIColor = UIColor.black {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var roundness: CGFloat = 0.0 {
        didSet{
            setupView()
        }
    }
    
    // MARK: Overrides ******************************************
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // Setup the view appearance
    private func setupView(){
        
        let colors:Array = [leftColor.cgColor, rightColor.cgColor]
        
        gradientLayer?.colors = colors
        gradientLayer?.cornerRadius = roundness
        gradientLayer?.endPoint = CGPoint(x: 1, y: 0)
        
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.16
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        
        self.clipsToBounds = false
        self.setNeedsDisplay()
        
    }
    
    var gradientLayer: CAGradientLayer? {
        return layer as? CAGradientLayer
    }
    
}
