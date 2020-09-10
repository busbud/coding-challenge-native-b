//
//  Onboarding+Pages+Extension.swift
//  BBOsheagaChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-06.
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
            // TODO: replace image with screenshots of the app at the end
            return OnboardingView(model: OnboardingModel( image: Image("OnboardingEnd"),
                title: Text(verbatim: "Busbud Osheaga Experience"),
                description: Text(verbatim: """
                It will be hot this summer in Montreal with the Osheaga festival!
                """)))
        case .detail:
            // TODO: replace image with screenshots of the app at the end
            return OnboardingView(model: OnboardingModel(
                image: Image("OnboardingEnd"),
                title: Text(verbatim: "New York City \nto Montreal"),
                description: Text(verbatim: """
                Find the best one-way departure from New York to Montreal!
                """)))
        case .end:
            // TODO: replace image with screenshots of the app at the end
            return OnboardingView(
              model: OnboardingModel(
                image: Image("OnboardingEnd"),
                title: Text(verbatim: "Let's go!"),
                description: Text(verbatim: """
                Click the button to start this amazing adventure!.
                """))
            )
        }
    }
}
