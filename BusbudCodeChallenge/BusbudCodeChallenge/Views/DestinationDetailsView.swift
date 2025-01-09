//
//  DestinationDetailsView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI
import CoreLocation

struct DestinationDetailsView: View {
    let viewModel: DestinationDetailsViewModelDefinition
    @State var openMap: Bool = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                infoView()
                mapView()
                    .frame(height: 300)
                    .cornerRadius(10)
                Button(action: {
                    viewModel.openURL()
                }, label: {
                    HStack {
                        Text("View on Busbud")
                        Image(systemName: "safari")
                    }
                    .contentShape(Rectangle())
                    .frame(maxWidth: .infinity)
                })
                .padding(.vertical)
                .foregroundStyle(.white)
                .background(.pink)
                .cornerRadius(10)
                
            }
        }
        .sheet(isPresented: $openMap) {
                mapView()
        }
        .navigationTitle("Destination Details")
        .padding(.horizontal)
    }
    
    private func infoView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.destination)
                    .font(.title)
                    .fontWeight(.semibold)
                Text(viewModel.region)
                    .foregroundColor(.secondary)
                Text(viewModel.country)
                    .foregroundColor(.secondary)
            }
            HStack(alignment: .center) {
                VStack {
                    Image(systemName: "arrow.up.right.circle")
                        .fontWeight(.light)
                    Text(viewModel.origin)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                VStack {
                    Text(viewModel.distance)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Rectangle()
                        .frame(maxWidth: 400, maxHeight: 2)
                        .foregroundStyle(.secondary)
                }
                VStack {
                    Image(systemName: "target")
                        .foregroundColor(.secondary)
                        .fontWeight(.bold)
                    Text(viewModel.destination)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .frame(maxWidth: 400)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
        )
    }
    
    private func mapView() -> some View {
        MapView(
            geoLocation: CLLocationCoordinate2D(latitude: viewModel.latitude, longitude: viewModel.longitude),
            destinationName: viewModel.destination,
            openMap: $openMap  // Pass the binding for modal presentation
        )
    }
}

#Preview {
    
    let destination = Destination(id: "asdf", name: "New York City", region: "New York", country: "United States", latitude: 40.7127, longitude: -73.998, geohash: "f25ep0")
    
    let viewModel = DestinationDetailsViewModel(origin: "Cuppertino", destination: destination)
    DestinationDetailsView(viewModel: viewModel)
}
