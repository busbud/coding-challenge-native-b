//
//  SearchView.swift
//  busbud
//
//  Created by Nitin kachhadiya on 27/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import SwiftUI
import BBServices

struct SearchView: View {
    
    weak var viewModel: HomeViewModel!

    @State private var showModal: Bool = false
    var onSearch = {}

    var body: some View {
        
        VStack(alignment: .leading) {
            
            SearchFieldView(name: "FROM", city: "New York")
            
            ZStack() {
                Divider().listRowInsets(EdgeInsets())
                HStack() {
                    Spacer()
                    Button(action: {
                        //TODO: Swape from and to location
                    }, label: {
                        Image("direction")
                        .frame(maxWidth: 40, maxHeight: 40)
                        .foregroundColor(Color.black)
                            .background(Color.clear)
                    })
                    .background(Color.clear)
                    .cornerRadius(20)
                    .clipped()
                }
            }
            .padding(.top, -20)

            SearchFieldView(name: "TO", city: "Montréal")

            
            Divider()

            HStack {
                
                VStack(alignment: .leading) {
                    
                    Text("DEPARTURE")
                    .font(.headline)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(.leading, 15)
                    .padding(.top, 5)

                    Button(action: {
                        self.showModal.toggle()
                    }, label: {
                        HStack(alignment: .top) {
                            Spacer().frame(width:0)
                            Text("26 Dec 2020")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color.black)
                            .padding(.leading, 15)
                            Spacer()
                        }
                    })
                    .padding(.top,10)
                }
                
                VStack(alignment: .leading) {

                    Text("TRAVELLERS")
                    .font(.headline)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(.leading, 15)
                    .padding(.top, 5)

                    Button(action: {
                                       
                                   }, label: {
                                    HStack(alignment: .top) {
                                           Spacer().frame(width:0)
                                           Text("01")
                                           .font(.title)
                                           .bold()
                                           .foregroundColor(Color.black)
                                           .padding(.leading, 15)
                                           Spacer()
                                       }
                    }).padding(.top,10)
                }
            }
            
            Divider().listRowInsets(EdgeInsets())
            
            Button(action: {
                self.onSearch()
            }, label: {
                HStack() {
                    Spacer()
                    Text("Search")
                        .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(Color.black)
                    Spacer()
                }
            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.busbudColor)
            .cornerRadius(25)
            .clipped()
            
        }
    }
    
    func onSearch(_ callback: @escaping () -> ()) -> some View {
        SearchView(onSearch: callback)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        
        let presenter = HomePresenter()
        let viewModel = HomeViewModel()
        viewModel.cities = City.defaultCities;
        viewModel.from = 0;
        presenter.viewModel = viewModel
        return SearchView(viewModel: viewModel)
    }
}
