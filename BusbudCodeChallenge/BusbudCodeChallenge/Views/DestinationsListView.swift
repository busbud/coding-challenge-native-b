//
//  DestinationsListView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI
import CoreLocation

struct DestinationsListView: View {
    @State var viewModel: DestinationListViewModelDefinition
    @State var locationManager: LocationManager = LocationManager()
    @State var currentLocationName: String = ""
    
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
                            DestinationDetailsView(viewModel: DestinationDetailsViewModel(origin: currentLocationName, destination: destination))
                        } label: {
                            DestinationsListRowView(title: destination.name, subTitle: "\(destination.distance ?? 0.0) km")
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
                        currentLocationName = try await currentLocation.coordinate.getLocationName() ?? ""
                        
                    } catch {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    let viewModel = DestinationListViewModel(state: .idle)
    DestinationsListView(viewModel: viewModel, currentLocationName: "Cupertino")
}
