//
//  SearchResultsView.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI

struct SearchResultsView: View {
    
    
    var departures: [Departure] = []
    var locations: [Location] = []
    
    
    var body: some View {
        
        List {
            ForEach(departures, id: \.id) { departure in
                SearchResulttRow(departure: departure, locations: locations)
            }
        }.listStyle(PlainListStyle())        
        
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        HStack.init(content: {
            SearchResultsView()
        })
    }
}

struct SearchResulttRow: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var departure: Departure
    var locations: [Location]
    
    var body: some View {
        
        HStack(content: {
            
            VStack(alignment: .leading, content: {
                Text(departure.departureArrivalReadable)
                    .font(Font.system(.callout).bold())
                    .foregroundColor(Color.primary)
                    .multilineTextAlignment(.leading)
                Text(locations.first?.name ?? "")
                    .font(Font.system(.subheadline))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            })
            
            Spacer()
            
            Text( String(format: "CA$%.02f", Float(departure.prices.total) / 100 ))
                .font(Font.system(.callout).bold())
                .foregroundColor(colorScheme == .dark ? .white :  Color("SecondaryColor"))
                .multilineTextAlignment(.trailing)
            
        })
        .padding(.all, 20)
        .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listStyle(SidebarListStyle())
    }
}
