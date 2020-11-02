//
//  OnboardingInteractor.swift
//  Osheaga Routes
//
//  Created by user on 01/11/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Lottie
import Foundation

final class OnboardingInteractor {
    lazy var steps: [OnboardingStep] = {
        
        var array: [OnboardingStep] = []
        
        
        array.append(OnboardingStep(title: "Welcome",
                                    body: "Excited for Osheaga? So are we! It is going to be incredible. Let’s get your things together.",
                                    animation: Animation.named("Onboarding1") as Any))
        
        array.append(OnboardingStep(title: "Choose your bus",
                                    body: "Browse through the available routes and find the one that fits you the best.",
                                    animation: Animation.named("Onboarding2") as Any))
        
        array.append(OnboardingStep(title: "That's it",
                                    body: "Ready for the an amazing experience?",
                                    animation: Animation.named("Onboarding3") as Any))
        
        return array
    }()
    
    init() {
        
    }
}

// MARK: - Extensions -

extension OnboardingInteractor: OnboardingInteractorInterface {
    
    func getStepsCount() -> Int {
        return steps.count
    }
    
    func getOnboardingStep(at index: Int) -> OnboardingStep? {
        guard steps.count > index else { return nil }
        return steps[index]
    }

}
