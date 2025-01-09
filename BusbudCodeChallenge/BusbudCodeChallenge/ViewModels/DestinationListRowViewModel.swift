//
//  DestinationListRowViewModel.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

protocol DestinationListRowViewModelDefinition {
    var title: String { get }
    var subtitle: String { get }
}

final class DestinationListRowViewModel: DestinationListRowViewModelDefinition {
    var title: String
    var subtitle: String
    
    init(destination: Destination) {
        self.title = destination.name
        let distance = destination.distance ?? 0.0
        let formattedDistance = DistanceFormatter.format(meters: distance)        
        self.subtitle = formattedDistance
    }
}
