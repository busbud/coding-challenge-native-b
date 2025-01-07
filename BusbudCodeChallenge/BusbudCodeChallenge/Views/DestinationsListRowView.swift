//
//  DestinationsListRowView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI

struct DestinationsListRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("London")
                .font(.title2)
            Text("100 KM")
                .font(.caption)
        }
    }
}

struct DestinationsListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            DestinationsListRowView()
            DestinationsListRowView()
            DestinationsListRowView()
            DestinationsListRowView()
        }
    }
}
