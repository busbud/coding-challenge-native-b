//
//  HomeView.swift
//  busbud
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import SwiftUI

struct HomeView: ViewInterface, View {

    var presenter: HomePresenterViewInterface!
    
    @EnvironmentObject var env: HomeEnvironment
    @ObservedObject var viewModel: HomeViewModel

    @State private var showModal: Bool = false
    @State var sheetType = 0;

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    init(presenter: HomePresenterViewInterface, viewModel: HomeViewModel) {
        
        self.viewModel = viewModel
        self.presenter = presenter
        self.presenter.fetchCities()

    }
    
    var body: some View {
                
        VStack{
            TitleView(title: Translation.busbud)
            Divider().shadow(color: Color.black, radius: 2, x: 0, y: 1)
            List {
                SearchView(viewModel: self.viewModel).onSearch {

                    self.presenter.fetchTravels(from: "", to: "", date: Date(), passanger: 1)
                }
                if self.viewModel.results != nil {

                    DeparturesView(departures: self.viewModel)
                } else {
                    PromotionView()
                }
            }
            .onAppear {
                UITableView.appearance().separatorStyle = .none
                UITableView.appearance().allowsSelection = false
            }
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        let presenter = HomePresenter()
        let viewModel = HomeViewModel()
        presenter.viewModel = viewModel
        return HomeView(presenter: presenter,
                        viewModel: viewModel)
            .environmentObject(HomeEnvironment())
            .environment(\.locale, .init(identifier: "en"))
    }
}
#endif

