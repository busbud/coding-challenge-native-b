//
//  DestinationsListView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI

struct DestinationsListView: View {
    @State var viewModel: DestinationListViewModelDefinition
    
    var body: some View {
        NavigationStack {
            List(viewModel.destinations) { destination in
                NavigationLink {
                    Text("TBD")
                } label: {
                    DestinationsListRowView(title: destination.name, subTitle: "200 km")
                }
            }
            .navigationTitle("Nearby Cities")
        }
    }
}

#Preview {
    let destinations = [
        Destination(id: "asdf", name: "London", region: "", country: "UK", latitude: 10.0, longitude: -10.0, geohash: "hgfdsa"),
        
        Destination(id: "qwerty", name: "Paris", region: "", country: "FR", latitude: 12.0, longitude: -12.0, geohash: "asdfgh")
    ]
    let viewModel = DestinationListViewModel(destinations: destinations)
    DestinationsListView(viewModel: viewModel)
}
