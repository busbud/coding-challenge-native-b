//
//  EmptyListView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack {
            Text("Bad luck!")
                .font(.title)
            Image(systemName: "location.slash")
                .font(.system(size: 64))
                .fontWeight(.thin)
                .padding(.vertical)
            Text("No cities were found around your location.")
        }
        .padding()
    }
}

#Preview {
    EmptyListView()
}
