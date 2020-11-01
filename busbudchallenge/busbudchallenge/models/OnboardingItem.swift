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
}

// Dummie objects, locations should be pulled from API, this is only for testing proposes
extension OnboardingItem {
    static let collection: [OnboardingItem] = [
        OnboardingItem(imageName: K.Identifiers.imOnboarding1, title: K.Strings.titleOnboarding1, description: K.Strings.subtitleOnboarding1),
        OnboardingItem(imageName: K.Identifiers.imOnboarding2, title: K.Strings.titleOnboarding2, description: K.Strings.subtitleOnboarding2),
        OnboardingItem(imageName: K.Identifiers.imOnboarding3, title: K.Strings.titleOnboarding3, description: K.Strings.subtitleOnboarding3),
    ]
}
