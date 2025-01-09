//
//  DestinationsListRowView.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI

struct DestinationsListRowView: View {
    let viewModel: DestinationListRowViewModelDefinition
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.title)
                .font(.title2)
            Text(viewModel.subtitle)
                .font(.caption)
        }
    }
}

struct DestinationsListRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        var london = Destination(id: "", name: "London", region: "", country: "UK", latitude: 0.0, longitude: 0.0, geohash: "")
//        london.distance = 100.00
        
        var paris = Destination(id: "", name: "Paris", region: "", country: "UK", latitude: 0.0, longitude: 0.0, geohash: "")
//        paris.distance = Double(723.4)
        
        List {
            DestinationsListRowView(viewModel: DestinationListRowViewModel(destination: london))
            DestinationsListRowView(viewModel: DestinationListRowViewModel(destination: paris))
        }
    }
}
