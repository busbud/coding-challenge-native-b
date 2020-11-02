//
//  Osheaga_RoutesApp.swift
//  Osheaga Routes
//
//  Created by user on 31/10/20.
//

import SwiftUI
import Combine

@main
struct Osheaga_RoutesApp: App {
    
    var body: some Scene {
        WindowGroup {
            
            ZStack.init(content: {
                
                HomeView()
                
            })
            
        }
    }
}
