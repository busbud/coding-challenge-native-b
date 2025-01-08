//
//  BusbudCodeChallengeApp.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/7/25.
//

import SwiftUI
import SwiftData

@main
struct BusbudCodeChallengeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
//            ContentView()
            let destinations = [
                Destination(id: "asdf", name: "London", region: "", country: "UK", latitude: 37.3349, longitude: -122.0090, geohash: "hgfdsa"),
                
                Destination(id: "qwerty", name: "Paris", region: "", country: "FR", latitude: 37.3349, longitude: -122.0090, geohash: "asdfgh")
            ]
            let viewModel = DestinationListViewModel(destinations: destinations, state: .loaded)
            DestinationsListView(viewModel: viewModel)
        }
        .modelContainer(sharedModelContainer)
    }
}
