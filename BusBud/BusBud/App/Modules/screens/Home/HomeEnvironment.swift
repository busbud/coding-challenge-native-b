//
//  HomeEnvironment.swift
//  busbud
//
//  Created by Nitin kachhadiya on 26/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import Combine

final class HomeEnvironment: ObservableObject {

    let objectWillChange = ObservableObjectPublisher()

    @Published var title = Translation.busbud {
       willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var type = 0 {
       willSet {
            self.objectWillChange.send()
        }
    }
}
