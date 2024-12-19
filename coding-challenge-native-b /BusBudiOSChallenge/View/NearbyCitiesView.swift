//
//  ContentView.swift
//  BusBudiOSChallenge
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 17/12/24.
//

import SwiftUI

struct NearbyCitiesView: View {
    @StateObject private var viewModel = CityViewModel()
    @State private var isAlertPresented = false
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.viewState {
                case .permissionDenied:
                    permissionDeniedView
                case .obtainingLocation:
                    obtainingLocationView
                case .cities:
                    cityListView
                case .error(let message):
                    errorView(message: message)
                }
            }
            .navigationTitle(NSLocalizedString("nearbyCitiesTitle", comment: "Title for Nearby Cities screen"))
        }
        .onAppear { 
            viewModel.fetchCities()
        }
        .alert(isPresented: $viewModel.permissionDeniedAlert) {
            Alert(
                title: Text(NSLocalizedString("locationPermissionDeniedTitle", comment: "Alert title when location is denied")),
                message: Text(NSLocalizedString("locationPermissionDeniedMessage", comment: "Alert message when location is denied")),
                primaryButton: .default(Text(NSLocalizedString("openSettingsButton", comment: "Button title to open settings"))) {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                },
                secondaryButton: .cancel() {
                    isAlertPresented = false
                }
            )
        }
    }
    
    private var permissionDeniedView: some View {
        Text(NSLocalizedString("permissionDeniedMessage", comment: "Message when location access is denied"))
            .multilineTextAlignment(.center)
            .padding()
    }
    
    private var obtainingLocationView: some View {
        ProgressView(NSLocalizedString("obtainingLocation", comment: "Message displayed while obtaining location"))
            .padding()
    }
    
    private var cityListView: some View {
        List(viewModel.cities) { city in
            NavigationLink(destination: CityDetailView(city: city)) {
                VStack(alignment: .leading) {
                    Text(city.cityName).font(.headline)
                    if let distance = city.distance {
                        Text(String(format: NSLocalizedString("distanceFormat", comment: "Format for distance display"), distance))
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
    
    private func errorView(message: String) -> some View {
        VStack {
            Text(message)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: viewModel.fetchCities) {
                Text(NSLocalizedString("tryAgainButton", comment: ""))
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
