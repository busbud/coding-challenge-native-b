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

final class HomeViewModel: ObservableObject {
 
    let objectWillChange = ObservableObjectPublisher()
   
    @Published var error: Bool = false {
        willSet {
            self.objectWillChange.send()
        }
    }
}
