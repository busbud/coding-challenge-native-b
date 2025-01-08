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
            Group {
                switch viewModel.state {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView()
                case .loaded:
                    List(viewModel.destinations) { destination in
                        NavigationLink {
                            DestinationDetailsView(viewModel: DestinationDetailsViewModel(origin: "Cuppertino", destination: destination))
                        } label: {
                            DestinationsListRowView(title: destination.name, subTitle: "200 km")
                        }
                    }
                    .navigationTitle("destinationList.navigation.title")
                case .empty:
                    EmptyListView()
                case .error:
                    ErrorView(title: "Error", message: "There was an error loading destinations.")
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchDestinations()
            }
        }
    }
}

#Preview {
    let destinations = [
        Destination(id: "asdf", name: "London", region: "Some", country: "UK", latitude: 10.0, longitude: -10.0, geohash: "hgfdsa"),
        
        Destination(id: "qwerty", name: "Paris", region: "An", country: "FR", latitude: 12.0, longitude: -12.0, geohash: "asdfgh")
    ]
    let viewModel = DestinationListViewModel(destinations: destinations, state: .loaded)
    DestinationsListView(viewModel: viewModel)
}
