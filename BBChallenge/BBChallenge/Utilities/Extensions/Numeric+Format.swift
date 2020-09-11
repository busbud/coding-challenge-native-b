//
//  Double+Format.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import Foundation

extension Int {
    func moneyFormat() -> String {
        String(format: "%2f", self)
    }
}
