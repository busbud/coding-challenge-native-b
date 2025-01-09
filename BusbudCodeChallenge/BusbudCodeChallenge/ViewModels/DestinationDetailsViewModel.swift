//
//  DestinationDetailsViewModel.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import Foundation
import UIKit

protocol DestinationDetailsViewModelDefinition {
    var origin: String { get }
    var destination: String { get }
    var region: String { get }
    var country: String { get }
    var distance: String { get }
    var latitude: Double { get }
    var longitude: Double { get }
    var geohash: String { get }
    
    func openURL()
}

final class DestinationDetailsViewModel: DestinationDetailsViewModelDefinition {
    let origin: String
    let destination: String
    let region: String
    let country: String
    let latitude: Double
    let longitude: Double
    let distance: String
    let geohash: String
    
    private let urlOpener: (URL) -> Void
    
    init(origin: String, destination: Destination, urlOpener: @escaping (URL) -> Void = { UIApplication.shared.open($0) }) {
        self.origin = origin
        self.destination = destination.name
        self.region = destination.region
        self.country = destination.country
        self.latitude = destination.latitude
        self.longitude = destination.longitude
        self.geohash = destination.geohash
        let distance = destination.distance ?? 0.0
        let formattedDistance = DistanceFormatter.format(meters: distance)
        self.distance = formattedDistance
        self.urlOpener = urlOpener
    }
    
    func openURL() {
        guard var url = URL(string: "https://www.busbud.com") else { return }
        let path = "en/c/\(geohash)"
        url.appendPathComponent(path)
        
        urlOpener(url)
    }
    
}
