//
//  SearchFieldView.swift
//  busbud
//
//  Created by Nitin kachhadiya on 28/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import SwiftUI

struct SearchFieldView: View {
    
    var name: String!
    var city: String!
    @State private var showModal: Bool = false

    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(name)
            .font(.headline)
            .foregroundColor(Color.gray.opacity(0.5))
            .padding(.leading, 15)
            .padding(.top, 5)

            Button(action: {

            }, label: {
                HStack(alignment: .top) {
                    Spacer().frame(width:0)
                    Text(city)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.black)
                    .padding(.leading, 15)
                    Spacer()
                }
            })
        }
    }
}

struct SearchFieldView_Previews: PreviewProvider {
    static var previews: some View {
        //SearchFieldView(name: "FROM", city: "New York")
        SearchFieldView(name: "TO", city: "Montréal")
    }
}
