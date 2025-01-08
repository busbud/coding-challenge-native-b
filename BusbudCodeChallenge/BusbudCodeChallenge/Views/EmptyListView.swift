//
//  EmptyListView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI

struct EmptyListView: View {
    @State private var animate = false
    
    var body: some View {
        VStack {
            Text("Lost in the middle of nowhere?")
                .font(.title)
            Image(systemName: "mappin.slash.circle")
                .font(.system(size: 64))
                .foregroundStyle(.gray)
                .fontWeight(.thin)
                .padding(.vertical)
                .scaleEffect(animate ? 1.0 : 0.5)
                .opacity(animate ? 1.0 : 0.0)
                .animation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.3), value: animate)
                .onAppear {
                    animate = true
                }
            Text("We couldn’t find any cities nearby—unless you count tumbleweeds!")
        }
        .padding()
    }
}

#Preview {
    EmptyListView()
}
