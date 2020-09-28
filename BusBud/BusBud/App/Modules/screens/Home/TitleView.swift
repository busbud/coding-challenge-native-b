//
//  TitleView.swift
//  busbud
//
//  Created by Nitin kachhadiya on 27/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import SwiftUI

struct TitleView: View {
    
    var title: String!
    @State private var showModal: Bool = false

    var body: some View {
        
        HStack(alignment: .center) {


            ZStack {
                Text(title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color.busbudColor)
                
                VStack(alignment: .trailing) {

                    Button(action: {
                        self.showModal.toggle()
                    }, label: {
                        HStack(alignment: .top) {
                            Spacer()
                            Text("Register")
                            .font(.body)
                            .bold()
                            .foregroundColor(Color.black)
                            .padding(.trailing, 15)
                            Spacer().frame(width:0)
                        }
                    }).sheet(isPresented: self.$showModal) {
                    
                        RegisterPage()
                    }
                }
                
            }
        }
    }
}


struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Hello, World!")
    }
}
