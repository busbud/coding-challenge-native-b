//
//  OnboardingWireframe.swift
//  Osheaga Routes
//
//  Created by user on 01/11/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class OnboardingWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: OnboardingViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = OnboardingInteractor()
        let presenter = OnboardingPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension OnboardingWireframe: OnboardingWireframeInterface {
    
    func dismiss() {
        DispatchQueue.main.async {
            self.viewController.dismiss(animated: true, completion: nil)
        }
    }
    
}
