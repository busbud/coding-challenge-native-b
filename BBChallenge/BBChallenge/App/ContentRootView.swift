//
//  ContentView.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI

/**
 Root view 
 */
struct ContentRootView: View {
    var body: some View {
        PageView(OnboardingPagesFactory.makeOnboardingViews())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentRootView()
    }
}
