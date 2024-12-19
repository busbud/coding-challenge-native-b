//
//  CityDetailsView.swift
//  BusBudiOSChallenge
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 17/12/24.
//

import SwiftUI
import MapKit

struct CityDetailView: View {
    let city: City
    
    var body: some View {
        VStack(spacing: 16) {
            Text("\(city.cityName), \(city.regionName), \(city.countryName)")
                .font(.title)
                .multilineTextAlignment(.center)
            
            if let distance = city.distance {
                Text(String(format: NSLocalizedString("distanceLabel", comment: "distance"), distance))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        
            Map(coordinateRegion: .constant(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )), annotationItems: [city]) { city in
                MapPin(coordinate: CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude), tint: .red)
            }
            .frame(height: 300)
            .cornerRadius(10)
            
            Button(action: openCityOnBusbud) {
                Text(NSLocalizedString("openInBusbud", comment: "Button to open city in Busbud"))
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func openCityOnBusbud() {
        if let url = URL(string: "https://www.busbud.com/en/c/\(city.geohash)") {
            UIApplication.shared.open(url)
        }
    }
}
