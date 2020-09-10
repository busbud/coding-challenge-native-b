//
//  PageViewController.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import UIKit
import SwiftUI

/**
 `PageViewController` is a utility for UIPageViewController in order to be used with SwiftUI.
 Must conform `UIViewRepresentable`
 */
struct PageViewController: UIViewControllerRepresentable {
    
    /**
     Implements the` makeUIViewController` from the `UIViewRepresentable` to wrap UIKit classes
     */
    func makeUIViewController(context: UIViewControllerRepresentableContext<PageViewController>) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true)
    }
    
    /// Create the coordinator that will handle UIKit events
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    /// internal controllers to control display
    var controllers: [UIViewController] = []
    
    /// Binding to listen the current page index of the PageViewController
    @Binding var currentPage: Int
    
    /// Utility class (coodinator) to implement UIPageViewController datasource and delegate methods
    class Coordinator : NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            guard index != 0 else {
                return nil
            }
            return parent.controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            guard index + 1 < parent.controllers.count else { return nil }
            
            return parent.controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool
        ) {
            
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
