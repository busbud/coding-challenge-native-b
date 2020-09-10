//
//  PageControl.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI
import UIKit

/**
 `PageControl` is a wrapper for UIPageControl in order to be used with SwiftUI.
    Must conform `UIViewRepresentable`
 */
struct PageControl: UIViewRepresentable {
    /// internal page counter index
    var pageCount: Int
    
    /// Page Control utility class (coodinator) to handle  page counter updates
    class PageCoordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
    
    /// Binding to listen the current page index of the PageViewController
    @Binding var currentPage: Int
    
    /**
     Implements the` makeUIView` from the `UIViewRepresentable` to wrap UIKit classes
    */
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = pageCount
        pageControl.addTarget(context.coordinator,
                              action: #selector(PageCoordinator.updateCurrentPage(sender:)),
                              for: .valueChanged)
        
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    /// Create the coordinator that will handle UIKit events
    func makeCoordinator() -> PageCoordinator {
        PageCoordinator(self)
    }
}
