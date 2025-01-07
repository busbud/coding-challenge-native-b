//
//  DestinationsListRowView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI

struct DestinationsListRowView: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
            Text(subTitle)
                .font(.caption)
        }
    }
}

struct DestinationsListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            DestinationsListRowView(title: "London", subTitle: "100 KM")
            DestinationsListRowView(title: "Paris", subTitle: "500 KM")
        }
    }
}
