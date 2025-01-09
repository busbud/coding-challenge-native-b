//
//  LoadingView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

import SwiftUI

struct LoadingView: View {
    @State private var pulseAnimation = false
    var body: some View {
        VStack {
            ZStack {
                // Pulsating Circles (Energy Wave)
                Circle()
                    .strokeBorder(Color.pink.opacity(0.3), lineWidth: 3)
                    .frame(width: 120, height: 120)
                    .scaleEffect(pulseAnimation ? 1.5 : 1.0)  // Expands outward
                    .opacity(pulseAnimation ? 0.0 : 1.0)  // Fades as it expands
                    .animation(.easeOut(duration: 2).repeatForever(autoreverses: false), value: pulseAnimation)
                
                Circle()
                    .strokeBorder(Color.pink.opacity(0.2), lineWidth: 2)
                    .frame(width: 160, height: 160)
                    .scaleEffect(pulseAnimation ? 1.8 : 1.2)
                    .opacity(pulseAnimation ? 0.0 : 0.5)
                    .animation(.easeOut(duration: 2.5).repeatForever(autoreverses: false), value: pulseAnimation)
                
                // Location Image
                Image(systemName: "location.north.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.pink)
                    .scaleEffect(pulseAnimation ? 1.05 : 1.0)  // Subtle bounce effect
                    .shadow(color: .pink.opacity(0.5), radius: 10, x: 0, y: 0)
                    .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: pulseAnimation)
            }
            .padding(.bottom, 60)
            Text("Finding nearby cities...")
                .padding(.top)
        }
        .onAppear {
            pulseAnimation = true  // Start the animations when the view appears
        }
        .padding()
    }
}


#Preview {
    LoadingView()
}
