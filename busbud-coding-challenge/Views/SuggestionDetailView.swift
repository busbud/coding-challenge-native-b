//
//  SuggestionDetailView.swift
//  busbud-coding-challenge
//
//  Created by Spencer Diniz on 17/12/24.
//

import SwiftUI
import MapKit

struct SuggestionDetailView: View {
    @ObservedObject var viewModel: SuggestionDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                LabelView(title: "City", value: viewModel.city)
                LabelView(title: "State / Province / Region", value: viewModel.region)
                LabelView(title: "Country", value: viewModel.country)
                LabelView(title: "Distance", value: viewModel.distance)

                MapView(coordinate: viewModel.coordinate, city: viewModel.city)
                    .frame(height: 300)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5), lineWidth: 1))
                    .padding(.vertical, 8)

                Button(action: goToWebsite) {
                    Text("Go to Busbud Website")
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.orange)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal, 20)
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
        }
        .background(Color(UIColor.systemBackground))
    }

    private func goToWebsite() {
        if let url = URL(string: "https://www.busbud.com/en/c/\(viewModel.geohash)") {
            UIApplication.shared.open(url)
        }
    }
}

struct LabelView: View {
    let title: LocalizedStringKey
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(Color.secondary)
            Text(value)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color.primary)
        }
    }
}

struct MapView: View {
    let coordinate: CLLocationCoordinate2D
    let city: String

    @State private var region: MKCoordinateRegion

    init(coordinate: CLLocationCoordinate2D, city: String) {
        self.coordinate = coordinate
        self.city = city
        _region = State(initialValue: MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 10000,
            longitudinalMeters: 10000
        ))
    }

    var body: some View {
        Map(position: .constant(.region(region)), interactionModes: []) {
            Annotation(city, coordinate: coordinate) {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.red)
                    .font(.title)
            }
        }
        .scrollDisabled(true)
        .onAppear {
            updateRegion()
        }
    }

    private func updateRegion() {
        region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 10000,
            longitudinalMeters: 10000
        )
    }
}

struct MapAnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}
