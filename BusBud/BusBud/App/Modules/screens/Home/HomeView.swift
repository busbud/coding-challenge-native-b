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

    var body: some View {
        NavigationView {

            VStack(alignment: .center) {
                Spacer()
                Text("Hello..")
                Spacer()
                Spacer()
            }
            .navigationBarTitle(Text(self.env.title))
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
