//
//  ContentView.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI

struct OnboardingStepView: View {
    
    var stepTitle: String
    var stepBody: String
    
    var body: some View {
        
        // Text UI
        VStack {
            Spacer()
            
            // Lottie Animation UI
            VStack(alignment: .center){
                LottieView(name: "Onboarding1")
                    .frame(width: 300, height: 300, alignment: .center)
            }
            .padding([.leading, .trailing], 0)
            
            Text(stepTitle)
                .font(Font.system(size: 36))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.bottom, 5.0)
            
            Text(stepBody)
                .font(Font.system(size: 20))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Spacer()
            
        }
        .padding([.leading, .trailing], 20)
        .padding(.vertical, 0)
        .frame(maxWidth: .infinity)
        .zIndex(2)
        
        
        
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStepView(stepTitle: "Title text", stepBody: "Body text")
    }
}
