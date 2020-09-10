//
//  OnboardingView.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI

/**
Generic onboarding view design
*/
struct OnboardingView : View {
  /// Reference to the data of the page
  var model: OnboardingModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Spacer()
            model.title
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(ColorManager.bbOsheagaAccentFlat)
                .shadow(color: Color.gray.opacity(0.4),
                        radius: 3, x: 1, y: 2)
                .animation(.easeIn(duration: 1))
            
            model.description
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(ColorManager.bbOsheagaAccentFlat)
                .lineLimit(nil)
                .padding()
                .shadow(color: Color.gray.opacity(0.4),
                        radius: 3, x: 1, y: 2)
                .animation(.easeIn(duration: 1))
            
            model.image?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .animation(.easeIn(duration: 1))
            
            Spacer()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding()
        .background(ColorManager.bbOsheagaPrimaryFlat)
        .edgesIgnoringSafeArea(.all)
        
    }
}

// Simple preview
struct OnboardingView_Previews : PreviewProvider {
    static var previews: some View {
        OnboardingView(
            model: OnboardingModel(
                image: Image("OnboardingEnd"),
                title: Text(verbatim: "Title"),
                description: Text(verbatim: "Content")
            )
        )
    }
}
