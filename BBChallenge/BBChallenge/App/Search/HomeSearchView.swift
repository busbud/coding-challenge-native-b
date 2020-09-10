//
//  HomeSearchView.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI

/**
 Search departures view.
 Defines all the criterias requested to search departures.
*/
struct HomeSearchView: View {
    /// View model with all the search criteria datasources and the state for the criteria selected
    @ObservedObject var viewModel: HomeSearchViewModel
    
    /// Init with viewmodel injection and plan view styles
    init(viewModel: HomeSearchViewModel) {
        self.viewModel = viewModel
        applyStyles()
    }
    
    /// All white styles
    func applyStyles() {
        UITableView.appearance().tableHeaderView =
            UIView(frame: CGRect(x: 0, y: 0, width: 0,
                                 height: Double.leastNonzeroMagnitude))
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        GeometryReader { proxy in
            Form {
                self.searchCriteriaSection
                self.startButton
            }
            .frame(width:proxy.size.width, height:proxy.size.height, alignment: .topLeading)
            .navigationBarTitle("Search Trip")
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

private extension HomeSearchView {
    
    /// Valid dates range
    var datesRange: ClosedRange<Date> {
        let start = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        let end = Calendar.current.date(byAdding: .year, value: 2, to: Date())!
        return start...end
    }
    
    /// Valid amount of tickets range
    var ticketsRange: ClosedRange<Double> {
        0...50
    }
    
    var searchCriteriaSection: some View {
        Section {
            // Select origin disabled
            Picker(selection: $viewModel.initialDestinationSelected, label: Text("🌇 From")) {
                ForEach(0..<viewModel.originsDatasource.count) { index in
                    Text(self.viewModel.originsDatasource[index].name)
                }
            }
            .disabled(true)
            // Select destination disabled
            Picker(selection: $viewModel.finalDestinationSelected, label: Text("🏝 To")) {
                ForEach(0..<viewModel.destinationsDatasource.count) { index in
                    Text(self.viewModel.destinationsDatasource[index].name)
                }
            }
            .disabled(true)
            Spacer()
            // Select departure date
            DatePicker(selection:$viewModel.departureDate,
                       in: datesRange, displayedComponents: [.date]) {
                        Text("🗓 Departure Date")
            }
            // Select number of adults
            HStack {
                Stepper("👨🏻‍💻 Adults", value: $viewModel.adult, in: ticketsRange, step: 1)
                Text(" \(String(format:"%.0f", round(viewModel.adult)))")
            }
            // Select number of children
            HStack {
                Stepper("👦🏻 Children", value: $viewModel.child, in: ticketsRange, step: 1)
                Text(" \(String(format:"%.0f", round(viewModel.child)))")
            }
            // Select number of seniors
            HStack {
                Stepper("👵🏻 Senior", value: $viewModel.senior, in: ticketsRange, step: 1)
                Text(" \(String(format:"%.0f", round(viewModel.senior)))")
            }
            // Select language
            Picker(selection: $viewModel.languageSelected, label: Text("🇺🇳 Languaje")) {
               ForEach(0..<viewModel.languagesDatasource.count) { index in
                   Text(self.viewModel.languagesDatasource[index].name)
               }
            }
            // Select currency
            Picker(selection: $viewModel.currencySelected, label: Text("💰 Currency")) {
               ForEach(0..<viewModel.currenciesDatasource.count) { index in
                   Text(self.viewModel.currenciesDatasource[index].name)
               }
           }
            
        }
    }
    
    /// Transition to the DeparturesView
    var startButton: some View {
        Section {
            GeometryReader { proxy in
                // create a DeparturesView injected from the ViewModel
                NavigationLink(destination: self.viewModel.departuresView) {
                    HStack(alignment: .center) {
                        Text(" 🕵️‍♂️ Search")
                        .font(.body)
                        .bold()
                        .foregroundColor(.white)
                    }
                    .frame(width:proxy.size.width - 80,
                           height: 40, alignment:.center)
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width:proxy.size.width - 64, height: 40, alignment:
                    .center)
                .background(LinearGradient(gradient:
                    .init(colors: [ColorManager.bbPrimary,ColorManager.bbOsheagaPrimaryFlat]),
                                           startPoint: .bottomLeading,
                                           endPoint: .topTrailing)
                )
                .cornerRadius(20)
                .padding(.horizontal, 32)
                .padding(.top, 32)
                .shadow(color: Color.gray.opacity(0.4),
                        radius: 6, x: 1, y: 2)
            }
        }
    }
}

// Simple preview
struct HomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchView(viewModel: HomeSearchViewModel())
    }
}
