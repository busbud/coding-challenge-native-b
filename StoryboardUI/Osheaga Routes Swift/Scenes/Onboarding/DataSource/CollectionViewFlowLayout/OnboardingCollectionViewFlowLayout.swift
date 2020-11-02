//
//  OnboardingCollectionViewFlowLayout.swift
//  Osheaga Routes Swift
//
//  Created by user on 01/11/20.
//

import UIKit

class OnboardingCollectionViewFlowLayout: UICollectionViewFlowLayout {

    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = UICollectionViewLayoutAttributes()
        
        attributes.alpha = 0.5
        attributes.transform = CGAffineTransform().scaledBy(x: 0.7, y: 0.7)
        
        return attributes
        
    }
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = UICollectionViewLayoutAttributes()
        
        attributes.alpha = 0
        attributes.transform = CGAffineTransform().scaledBy(x: 0.7, y: 0.7)
        
        return attributes
    }
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = UICollectionViewLayoutAttributes()
        
        attributes.alpha = 0
        attributes.transform = CGAffineTransform().scaledBy(x: 0.7, y: 0.7)
        
        return attributes
        
    }
}
