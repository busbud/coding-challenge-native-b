//
//  OnboardingViewController.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import Swinject
import SwinjectAutoregistration
import UIKit

class OnboardingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func startApp(_ sender: Any) {
        let search = Assembler.sharedAssmbler.resolver ~> SearchViewController.self
        search.modalPresentationStyle = .fullScreen
        self.show(search, sender: nil)
    }
}
