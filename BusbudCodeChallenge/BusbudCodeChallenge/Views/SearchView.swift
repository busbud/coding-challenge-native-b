//
//  SearchView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/8/25.
//

import SwiftUI
import CoreLocation

struct SearchView: View {
    @State var searchLocation: String = ""
    @State var locationManager: LocationManager = LocationManager()
    @State var locationButtonIsActive = true
    @State var authorizationState: LocationAuthorizationState = .notDetermined
    @State var origin: Origin?
    @Binding var shouldSearch: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Where would you like to start?")
                    .font(.title2)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.pink)
                    TextField("Enter a city.", text: $searchLocation)
                        .disabled(true)
                }
                .padding(.vertical, 10)
                .overlay(
                    Rectangle().frame(height: 2).padding(.top, 35)
                        .foregroundStyle(.pink)
                )
                .padding(.vertical)
                
                Button {
                    switch authorizationState {
                    case .authorized:
                        fetchOrigin(shouldRequestPermission: false)
                    case .notDetermined:
                        fetchOrigin(shouldRequestPermission: true)
                    case .denied:
                        openSettingsApp()
                    }
                    
                } label: {
                    HStack {
                        Image(systemName: locationButtonIsActive ? "location" : "location.slash")
                        Text("Use current location")
                    }
                    .contentShape(Rectangle())
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(locationButtonIsActive ? .white : Color(red: 0.8, green: 0.8, blue: 0.8))
                }
                .padding(.vertical)
                .background(.pink)
                .cornerRadius(10)
            }
            Spacer()
        }
        .padding(.horizontal)
        .onAppear {
            authorizationState = locationManager.requestCurrentPermissionState()
            locationButtonIsActive = authorizationState == .authorized
        }
    }
    
    private func fetchOrigin(shouldRequestPermission: Bool) {
        Task {
            do {
                if shouldRequestPermission {
                    authorizationState = try await locationManager.requestPermission()
                }
                
                let currentLocation = try await locationManager.requestCurrentLocation()
                let locationName = try await currentLocation.coordinate.getLocationName()
                
                origin = Origin(name:  locationName ?? "", latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.latitude)
                
                locationButtonIsActive = true
                Logger.log("Current Location: \(origin!.latitude), \(origin!.longitude)")
                searchLocation = origin?.name ?? ""
                shouldSearch = true
            } catch {
                Logger.log("Failed to get location: \(error)")
            }
        }
    }
    
    private func openSettingsApp() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            Logger.log("Invalid URL")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        locationButtonIsActive = false
    }
}

#Preview {
    SearchView(locationManager: LocationManager(), shouldSearch: .constant(false))
}
