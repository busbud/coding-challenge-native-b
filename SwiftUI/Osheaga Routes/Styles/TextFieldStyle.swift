//
//  TextStyle.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI

struct MainTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {        
        configuration
            .lineLimit(1)
            .cornerRadius(4)
            .disabled(true)
            .frame(minHeight: 40)
            .padding(.leading, 10)
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
            .font(Font.system(size: 14).italic())
            .accentColor(.red)
            .textFieldStyle(DefaultTextFieldStyle())
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
