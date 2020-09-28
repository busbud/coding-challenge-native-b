//
//  HomeViewModel.swift
//  busbud
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import BBServices

final class HomeViewModel: ObservableObject {
 
    let objectWillChange = ObservableObjectPublisher()
   
    @Published var error: Bool = false {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var cities: [City] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var passengers: [String] = ["01","02","03","04","05"] {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var to: Int = 0 {
        willSet {
            self.objectWillChange.send()
        }
    }

    @Published var from: Int = 1 {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var departureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date())! {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var travellers: Int = 0 {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var results: DeparturesResponse? = nil {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var child: Double = 0 {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var adult: Double = 1 {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var senior: Double = 0 {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var fetchResult: Bool = false {
        willSet {
            self.objectWillChange.send()
        }
    }
}
