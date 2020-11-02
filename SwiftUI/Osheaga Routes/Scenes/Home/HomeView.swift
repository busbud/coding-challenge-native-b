//
//  HomeView.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    enum SearchState {
        case initial, loading, loaded, empty, error
    }
    
    @State var cancelable: AnyCancellable?
    
    @State var searchResults: SearchResult?
    
    @State var onboardShowing = true
    @State var currentState: SearchState = .initial

    @Environment(\.colorScheme) var colorScheme {
        didSet {
            UINavigationBar.appearance().barTintColor =  UIColor(named: "SecondaryColor")
        }
    }

    init() {
        
        // Making sure the navigation bar goes perfect with the search box
        // Theses properties being set in here are simply because at the
        // moment there's no equivalent in SwiftUI.
        
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().scrollEdgeAppearance?.shadowColor = .clear
            
        UINavigationBar.appearance().barTintColor =  UIColor(Color("SecondaryColor"))
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    private func retrieveRoutesFromServer() {
        
        let from = City.init(id: "0", name: "Quebec", geohash: "f2m673")
        let to = City.init(id: "1", name: "Montreal", geohash: "f25dvk")
        
        let publisher = SearchService.init().getRoutes(from: from, to: to, at: Date().addingTimeInterval(60 * 60 * 24), for: 1)
        
        currentState = .loading
        
        cancelable = publisher?.sink(receiveCompletion: { (subscriber) in
            
            switch subscriber {
            case .finished: break
            case .failure(let error):
                self.currentState = .error
            }
            
        }, receiveValue: { (searchResults) in
            
            self.searchResults = searchResults
            self.currentState = .loaded
            
        })
        
    }
    
    var body: some View {
        
        NavigationView(content: {
            
            VStack(alignment: .center) {

                VStack {
                    
                    SearchView(userWantsToSearch: {
                        retrieveRoutesFromServer()
                    })
                    
                    if currentState == .loaded {
                        SearchResultsView(departures: searchResults?.departures ?? [],
                                          locations: searchResults?.locations ?? [])
                    }
                    
                    if currentState == .loading {
                        SearchResultsLoading()
                    }
                    
                    if currentState == .empty {
                        SearchResultsEmptyResults()
                    }
                    
                    if currentState == .error {
                        SearchResultsError(userWantsToTryAgain: {
                            retrieveRoutesFromServer()
                        })
                    }
                    
                    if currentState == .initial {
                        SearchResultsWelcome()
                    }
                    
                    
                    Spacer()
                }
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity)


            }
            .padding([.all], 0)
            .sheet(isPresented: $onboardShowing, onDismiss: nil, content: {
                OnboardingView(showOnboarding: $onboardShowing)
            })
            
            
            .navigationBarTitle("Bus tickets", displayMode: .inline)
            
        })
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
