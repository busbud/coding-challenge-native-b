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

    @Published var title = Translation.HomeTitle {
       willSet {
            self.objectWillChange.send()
        }
    }
}
