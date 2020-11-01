//
//  Onboarding.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import Foundation

struct OnboardingItem: Equatable {
    var imageName: String
    var title: String
    var description: String
    
    static let collection: [OnboardingItem] = [
        OnboardingItem(imageName: "imOnboarding1", title: "Osheaga Festival", description: "Come to live the unbelievable experience of Osheaga Festival"),
        OnboardingItem(imageName: "imOnboarding2", title: "Discover New Artists", description: "Discover your new favorite artists and support national talent"),
        OnboardingItem(imageName: "imOnboarding3", title: "Feel the Music!", description: "Feel how the music takes over you, this and much more at Osheaga Festival"),
    ]
}
