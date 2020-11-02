//
//  ButtonStyle.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    
    enum MainButtonStyleType {
        case classic
        case minimal
    }
    
    let style: MainButtonStyle.MainButtonStyleType
    
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack {
            configuration.label
                .shadow(color: Color.black.opacity(0.16), radius: 6, x: 1, y: 1)
                .frame(minWidth: style == .classic ? 0 : nil,
                       maxWidth: style == .classic ? .infinity : nil,
                       minHeight: 40)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("PrimaryButtonColorGradientOne"), Color("PrimaryButtonColorGradientTwo")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .padding(.horizontal, style == .classic ? 20 : nil)
        }
    }
}
