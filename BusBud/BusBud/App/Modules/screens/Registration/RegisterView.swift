//
//  RegisterView.swift
//  busbud
//
//  Created by Nitin kachhadiya on 27/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import SwiftUI

struct registerText: View {
    var body: some View {
        Text(Translation.registerTitle)
            .font(.headline)
            .bold()
            .foregroundColor(Color.black)
    }
}
 
struct registerSubText: View {
    var body: some View {
        Text(Translation.registerSubTitle)
            .font(.subheadline)
            .foregroundColor(Color.black)
    }
}
 
//TODO: Focusable when registration screen is appear
struct emailTextField: View {
    
    @Binding var email: String
    
    var body: some View {
        return TextField(Translation.email, text: $email)
            .frame(maxWidth: .infinity, maxHeight: 20)
            .keyboardType(.emailAddress)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .autocapitalization(.none)
    }
}
 
struct registerButtonStyle: View {
        
    var body: some View {
        Text(Translation.register)
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundColor(Color.white)
            .background(Color.busbudColor)
    }
}

//TODO: Display registration page in half model view and set corner on top
struct RegisterPage: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var email: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            .frame(height: 20)
            registerText()
            registerSubText()
            Spacer()
            .frame(height: 50)
            emailTextField(email: $email)
            Spacer()
            .frame(height: 50)
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                registerButtonStyle()
            })
            .cornerRadius(25)
            .clipped()
            Spacer()
        }
        .padding()
    }
}
