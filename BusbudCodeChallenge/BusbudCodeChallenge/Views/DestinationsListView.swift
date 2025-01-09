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
    @State var shouldRetry = false
    @State var shouldChangeLocation: Bool = false
    @State var shouldSearch: Bool = false
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .idle:
                    SearchView(shouldSearch: $shouldSearch)
                case .loading:
                    ProgressView()
                case .loaded(let destinations):
                    List(destinations) { destination in
                        NavigationLink {
                            DestinationDetailsView(viewModel: DestinationDetailsViewModel(origin: currentLocationName, destination: destination))
                        } label: {
                            DestinationsListRowView(viewModel: DestinationListRowViewModel(destination: destination))
                        }
                    }
                    .refreshable {
                        fetchData()
                    }
                    .navigationTitle("Nearby Cities")
                case .empty:
                    EmptyListView(shouldChangeLocation: $shouldChangeLocation)
                case .error:
                    ErrorView(title: "Oops", message: "There was an error loading the nearby cities.", shouldRetry: $shouldRetry)
                }
            }
        }
        .onAppear {
            fetchData()
        }
        .onChange(of: shouldRetry) { _, _ in
            Logger.log("performing retry")
            fetchData()
        }
        .onChange(of: shouldChangeLocation) { _, _ in
            Logger.log("change location")
            viewModel.state = .idle
        }
        .onChange(of: shouldSearch) { _, _ in
            Logger.log("fetch data from search")
            fetchData()
        }
    }
    
    private func fetchData() {
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

#Preview {
    let viewModel = DestinationListViewModel(state: .idle)
    DestinationsListView(viewModel: viewModel, currentLocationName: "Cupertino")
}
