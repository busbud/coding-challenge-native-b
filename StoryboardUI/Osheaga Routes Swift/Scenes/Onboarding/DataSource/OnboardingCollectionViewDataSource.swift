//
//  OnboardingCollectionViewDataSource.swift
//  Osheaga Routes Swift
//
//  Created by user on 01/11/20.
//

import UIKit
import Lottie

protocol OnboardingCollectionViewDelegate: class {
    
    func userArrivedOnEnd()
    func userLeavingEnd()
    
    func getOnboardingTitle(at index: Int) -> String
    func getOnboardingBody(at index: Int) -> String
    func getOnboardingAnimation(at index: Int) -> Any?
}

class OnboardingCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var flowLayout: OnboardingCollectionViewFlowLayout!
    weak var delegate: OnboardingCollectionViewDelegate?
    
    private var dispatchGroup: DispatchGroup?
    private var hasReachEnd = false
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.width, height: collectionView.height)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let rawCell = collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: indexPath)
        
        if let cell = rawCell as? OnboardingCollectionViewCell, let delegate = delegate {
            
            let animation = delegate.getOnboardingAnimation(at: indexPath.row) as? Animation
            
            cell.titleLabel.text = delegate.getOnboardingTitle(at: indexPath.row)
            cell.bodyLabel.text = delegate.getOnboardingBody(at: indexPath.row)
            cell.onboardingAnimationView.animation = animation
            cell.onboardingAnimationView.loopMode = .loop
            cell.onboardingAnimationView.play()
            
        }
        
        return rawCell
    }
    
}


extension OnboardingCollectionViewDataSource {
    
    func scrollToNextOnboardingStep(in collectionView: UICollectionView) {
        
        // So... there's a thing.
        
        // This code depends on the actual state of the CollectionView to
        // calculate where it will end. Ok. But then, what if the user taps
        // twice the button quickly? The code scrolls to an unwanted position.
        
        // How do we fix it?
        
        // With DispatchGroup. Making sure the calls happens when they should.
        // Everytime the user is interacting with the scrolling, either by swiping or
        // pressing the next button, we are going to keep track of that. When the
        // interaction is over, any other pending interaction will be performed
        // with the correct values. No weird behaviour then. Also, let's make sure we're
        // using the correct threads, we should never lock the main thread with a waiting
        // command, right? Nor we want to perform UI operations in a background thread.
        
        DispatchQueue.global().async {
            
            if self.dispatchGroup != nil {
                guard self.dispatchGroup!.wait(timeout: .now() + 2) == .success else { return }
            }else{
                self.dispatchGroup = DispatchGroup()
            }
            
            DispatchQueue.main.async {
                
                self.dispatchGroup?.enter()
                
                collectionView.scrollRectToVisible(self.calculateRect(collectionView), animated: true)
                
                self.setUpDispatchKiller(self.dispatchGroup)
            }
            
        }
    }
    
    private func calculateRect(_ scrollView: UIScrollView) -> CGRect {
        let x = scrollView.contentOffset.x + scrollView.width
        return  CGRect(x: x, y: 0, width: scrollView.width, height: scrollView.height)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        dispatchGroup?.leave()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        dispatchGroup?.leave()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let threshHold = (scrollView.contentSize.width - 100)
        let reachingEnd = scrollView.contentOffset.x + scrollView.width >= threshHold
        
        if reachingEnd && !hasReachEnd {
            
            // User arrived at the end
            
            hasReachEnd = true
            delegate?.userArrivedOnEnd()
            
        }
        
        if !reachingEnd && hasReachEnd{
            
            // User coming back to the start
            
            hasReachEnd = false
            delegate?.userLeavingEnd()
            
        }
        
        
        if dispatchGroup == nil {
            dispatchGroup = DispatchGroup()
            dispatchGroup?.enter()
            setUpDispatchKiller(dispatchGroup)
        }

        
    }
    
    private func setUpDispatchKiller(_ dispatchGroup: DispatchGroup?) {
        
        dispatchGroup?.notify(queue: .global(), execute: { [weak self] in
            
            // Let's avoid retain cycle
            
            guard self != nil else { return }
            self?.dispatchGroup = nil
            
        })
        
    }
}
