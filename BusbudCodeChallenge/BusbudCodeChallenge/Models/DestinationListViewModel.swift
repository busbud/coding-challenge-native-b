//
//  DestinationListViewModel.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import Foundation

protocol DestinationListViewModelDefinition {
    var destinations: [Destination] { get }
}


@Observable
final class DestinationListViewModel: DestinationListViewModelDefinition {
    let destinations: [Destination]
    
    init(destinations: [Destination]) {
        self.destinations = destinations
    }
}
