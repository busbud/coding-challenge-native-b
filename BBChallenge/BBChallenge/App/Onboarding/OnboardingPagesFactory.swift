//
//  OnboardingPagesFactory.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI

/**
 Generic page fields for the onboarding
*/
struct OnboardingPagesFactory {

    /**
     Generate the list of pages
    */
    static func makeOnboardingViews() -> [OnboardingView] {
        return OnboardingPages.allCases.map { $0.page }
    }
    
}

/**
 Each page case abstraction
*/
enum OnboardingPages: CaseIterable {
    case intro
    case detail
    case end
}

/**
 Define the default values for each Page
*/
extension OnboardingPages {
    var page: OnboardingView {
        switch self {
        case .intro:
            return OnboardingView(model: OnboardingModel( image: Image("Onboarding1"),
                title: Text(verbatim: "Busbud Osheaga Experience"),
                description: Text(verbatim: """
                It will be hot this summer in Montreal with the Osheaga festival!
                """)))
        case .detail:
            return OnboardingView(model: OnboardingModel(
                image: Image("Onboarding2"),
                title: Text(verbatim: "New York City \nto Montreal"),
                description: Text(verbatim: """
                Find the best one-way departure from New York to Montreal!
                """)))
        case .end:
            return OnboardingView(
              model: OnboardingModel(
                image: Image("OnboardingInit"),
                title: Text(verbatim: "Let's go!"),
                description: Text(verbatim: """
                Click the button to start this amazing adventure!.
                """))
            )
        }
    }
}
