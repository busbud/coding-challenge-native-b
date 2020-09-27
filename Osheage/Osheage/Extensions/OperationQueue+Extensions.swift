//
//  OperationQueue+Extensions.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import Foundation

extension OperationQueue {
    convenience init(with name: String) {
        self.init()
        self.name = name
    }
}
