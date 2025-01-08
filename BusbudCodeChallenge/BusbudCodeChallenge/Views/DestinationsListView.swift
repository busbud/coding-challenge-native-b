//
//  DestinationsListView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI

struct DestinationsListView: View {
    @State var viewModel: DestinationListViewModelDefinition
    @State var locationManager: LocationManager = LocationManager()
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .idle:
                    EmptyListView()
                case .loading:
                    ProgressView()
                case .loaded(let destinations):
                    List(destinations) { destination in
                        NavigationLink {
                            DestinationDetailsView(viewModel: DestinationDetailsViewModel(origin: "Cuppertino", destination: destination))
                        } label: {
                            DestinationsListRowView(title: destination.name, subTitle: "200 km")
                        }
                    }
                    .navigationTitle("Nearby Cities")
                case .empty:
                    EmptyListView()
                case .error:
                    ErrorView(title: "Error", message: "There was an error loading destinations.")
                }
            }
        }
        .onAppear {
            let locationPermissionState = locationManager.requestCurrentPermissionState()
            
            if locationPermissionState == .authorized {
                Task {
                    do {
                        let currentLocation = try await  locationManager.requestCurrentLocation()
                        await viewModel.fetchNearbyDestinationsFrom(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
                        
                    } catch {
                        
                    }
                }
            } else {
//                viewModel.state = .idle
            }
        }
    }
}

#Preview {
    let viewModel = DestinationListViewModel(state: .idle)
    DestinationsListView(viewModel: viewModel)
}
