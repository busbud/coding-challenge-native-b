//
//  NSDate+Comparable.swift
//  Busbud
//
//  Created by Camille Kander on 2/12/16.
//  Copyright © 2016 xzoky. All rights reserved.
//

import Foundation

public func ==(left: NSDate, right: NSDate) -> Bool {
    return left === right || left.compare(right) == .OrderedSame
}

public func <(left: NSDate, right: NSDate) -> Bool {
    return left.compare(right) == .OrderedAscending
}

extension NSDate: Comparable { }
