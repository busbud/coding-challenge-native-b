//
//  ErrorView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI

struct ErrorView: View {
    var title: String = "Oops"
    var imageName: String = "exclamationmark.triangle"
    var message: String = "An error occurred"
    @Binding var shouldRetry: Bool
    @State private var animate = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
            Image(systemName: imageName)
                .font(.system(size: 64))
                .foregroundStyle(.red)
                .fontWeight(.thin)
                .padding(.vertical)
                .scaleEffect(animate ? 1.0 : 0.5)
                .opacity(animate ? 1.0 : 0.0)
                .animation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.3), value: animate)
                .onAppear {
                    animate = true
                }
            Text(message)
            Button(action: {
                shouldRetry = true
            }, label:
                    {
                Text("Try again")
                    .contentShape(Rectangle())
                    .frame(maxWidth: .infinity)
            }
                   
            )
            .padding(.vertical)
            .background(.pink)
            .foregroundStyle(.white)
            .cornerRadius(10)
            
        }
        .padding()
    }
}

#Preview {
    ErrorView(shouldRetry: .constant(false))
}
