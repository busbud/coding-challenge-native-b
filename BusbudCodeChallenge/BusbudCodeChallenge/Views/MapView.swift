//
//  MapView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    let geoLocation: CLLocationCoordinate2D
    let destinationName: String
    
    @State var region: MKCoordinateRegion
    @Binding var openMap: Bool
    
    init(geoLocation: CLLocationCoordinate2D, destinationName: String, openMap: Binding<Bool>) {
        self.geoLocation = geoLocation
        self.destinationName = destinationName
        self._openMap = openMap
        
        _region = State(initialValue: MKCoordinateRegion(
            center: geoLocation,
            span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
        ))
    }
    
    var body: some View {
        Map(position: .constant(.region(region)), interactionModes: [.all]) {
            Annotation(destinationName, coordinate: geoLocation) {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.pink)
                    .font(.title)
            }
        }
        .scrollDisabled(true)
        .overlay(
            VStack(alignment: .trailing) {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            openMap.toggle()
                        }
                    }) {
                        Image(systemName: "map")
                            .font(.title2)
                            .padding(10)
                            .background(
                                Circle()
                                    .fill(.ultraThinMaterial)
                            )
                            .foregroundColor(.pink)
                            .padding(.bottom, 8)
                        
                    }
                    .padding(.horizontal)
                }
            }
        )
    }
}

#Preview {
    let location = CLLocationCoordinate2D(latitude: 40.7127, longitude: -73.998)
    let destinationName = "New York City"
    
    MapView(geoLocation: location, destinationName: destinationName, openMap: .constant(false))
}
