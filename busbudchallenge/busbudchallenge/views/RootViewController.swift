//
//  ViewController.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit

class RootViewController: UIViewController {
    
    private var isFirstRun = true
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = .corporatePink
        delay(durationInSeconds: 1) {
            self.showInitialView()
        }
    }
    
}

private extension RootViewController {
    func showInitialView() {
        if isFirstRun {
            let controller = OnboardingViewController()
            controller.modalPresentationStyle = .overFullScreen
            present(controller, animated: true)
        } else {
            let controller = BookingViewController()
            controller.modalPresentationStyle = .overFullScreen
            present(controller, animated: true)
        }
    }
}
