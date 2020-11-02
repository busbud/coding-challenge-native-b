//
//  OnboardingView.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI


struct OnboardingView: View {
    
    @State var currentStep: Double = 0
    @Binding var showOnboarding: Bool
    
    var buttonStyle: some ButtonStyle {
        get {
            if currentStep == 2 {
                return MainButtonStyle(style: .classic)
            }
            
            return MainButtonStyle(style: .minimal)
        }
    }
    
    var offset: CGFloat {
        if currentStep == 0 { return 100 }
        if currentStep == 1 { return 175 }
        return 250
    }
    
    var body: some View {
        
        ZStack {
            
            if currentStep == 0 {
                
                OnboardingStepView(stepTitle: "Welcome", stepBody: "Excited for Osheaga? So are we! It is going to be incredible. Let’s get your things together.")
                    .transition(AnyTransition.asymmetric(insertion: .onboardingAnimation(.appear), removal: .onboardingAnimation(.disappear)))
                    .animation(.default)
                
            } else if currentStep == 1 {
                
                OnboardingStepView(stepTitle: "Choose your bus", stepBody: "Browse through the available routes and find the one that fits you the best.")
                    .transition(AnyTransition.asymmetric(insertion: .onboardingAnimation(.appear), removal: .onboardingAnimation(.disappear)))
                    .animation(.default)
                
            } else if currentStep == 2 {
                
                OnboardingStepView(stepTitle: "That's it", stepBody: "Ready for the an amazing experience?")
                    .transition(AnyTransition.asymmetric(insertion: .onboardingAnimation(.appear), removal: .onboardingAnimation(.disappear)))
                    .animation(.default)
                
            } else {
                EmptyView()
            }
            
        }
        .overlay (
            
            Group {
                
                Button(action: {
                    
                    withAnimation {
                        if currentStep < 2 {
                            currentStep += 1
                        } else {
                            showOnboarding = false
                        }
                    }
                    
                }){
                    
                    HStack {
                        if currentStep == 2 {
                            Text("LET'S GO").fontWeight(.heavy)
                        } else {
                            Image("ic-next-arrow")
                        }
                    }
                    
                }
                .padding([.trailing, .bottom, .leading], 20)
                .buttonStyle(buttonStyle)
                
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .bottomTrailing)
            
        ).background(
            
            // Blue shadows
            ZStack(alignment: .bottom, content: {
                
                Spacer()
                    .background(Color("SecondarySeeThroughColor"))
                    .padding([.leading, .trailing], 0)
                    .frame(height: 300, alignment: .bottom)
                    .rotationEffect(Angle(degrees: -10 + (currentStep * 1.2)))
                    .scaleEffect(x: 2, y: 2, anchor: .top)
                    .offset(y: offset)
                
                
                Spacer()
                    .background(Color("SecondarySeeThroughColor"))
                    .padding([.leading, .trailing], 0)
                    .frame(height: 300, alignment: .bottom)
                    .rotationEffect(Angle(degrees: 20 - (currentStep * 3)))
                    .scaleEffect(x: 2, y: 2, anchor: .top)
                    .offset(y: offset)
                
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(.all, 0)
            .edgesIgnoringSafeArea(.bottom)
            .zIndex(0)
            
        )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    
    static var previews: some View {
        OnboardingView(showOnboarding: Binding(get: {
            return false
        }, set: { _ in
            
        }))
    }
}
