//
//  AnyTransitionExtensions.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI

extension AnyTransition {
    
    enum moveAndFadeState {
        case appear, disappear
    }
    
    static func onboardingAnimation(_ state: moveAndFadeState) -> AnyTransition {
        
        if state == .appear {
            return AnyTransition
                .move(edge: .trailing)
                .combined(with: .opacity)
                .combined(with: .scale(scale: 0.85, anchor: .bottomLeading))
        } else {
            return AnyTransition
                .move(edge: .leading)
                .combined(with: .opacity)
                .combined(with: .scale(scale: 0.85, anchor: .bottomTrailing))
        }
        
    }
}
