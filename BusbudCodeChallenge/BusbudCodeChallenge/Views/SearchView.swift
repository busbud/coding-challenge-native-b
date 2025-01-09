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
    @State var currentLocation: CLLocation?
    @Binding var shouldSearch: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Where would you like to start?")
                    .font(.headline)
                TextField("Enter a city to see what’s nearby.", text: $searchLocation)
                Button {
                    switch authorizationState {
                    case .authorized:
                        Task {
                            do {
                                currentLocation = try await locationManager.requestCurrentLocation()
                                locationButtonIsActive = true
                                print("Current Location: \(currentLocation?.coordinate.latitude ?? 0), \(currentLocation?.coordinate.longitude ?? 0)")
                                let locationName = try await currentLocation?.coordinate.getLocationName()
                                print("Location Name: \(locationName ?? "UNKNOWN")")
                                if let locationName = locationName {
                                    searchLocation = locationName
                                }
                                shouldSearch = true
                            } catch {
                                print("Failed to get location: \(error)")
                            }
                        }
                    case .notDetermined:
                        Task {
                            do {
                                authorizationState = try await locationManager.requestPermission()
                                currentLocation = try await locationManager.requestCurrentLocation()
                                locationButtonIsActive = true
                                print("Current Location: \(currentLocation?.coordinate.latitude ?? 0), \(currentLocation?.coordinate.longitude ?? 0)")
                            } catch {
                                print("Failed to obtain location permission: \(error)")
                            }
                        }
                    case .denied:
                        guard let url = URL(string: "app-settings://privacy/Location") else {
                            print("Invalid URL")
                            return
                        }
                        UIApplication.shared.open(url)
                        locationButtonIsActive = false
                    }
                    
                } label: {
                    HStack {
                        Image(systemName: locationButtonIsActive ? "location" : "location.slash")
                        Text("Use current location")
                    }
                    .contentShape(Rectangle())
                    .frame(maxWidth: .infinity)
                }
                .padding(.vertical)
                .foregroundStyle(locationButtonIsActive ? .white : .gray)
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
}

#Preview {
    SearchView(locationManager: LocationManager(), shouldSearch: .constant(false))
}
