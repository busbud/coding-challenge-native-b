//
//  ErrorView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI

struct ErrorView: View {
    var title: String = "Error"
    var imageName: String = "exclamationmark.triangle"
    var message: String = "An error occurred"
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
            Image(systemName: imageName)
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundStyle(.red)
                .padding()
            Text(message)
            
        }
        .padding()
    }
}

#Preview {
    ErrorView()
}
