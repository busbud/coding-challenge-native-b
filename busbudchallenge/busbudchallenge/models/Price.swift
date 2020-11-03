//
//  Price.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 3/11/20.
//

import Foundation

struct Price: Codable {
    var total: Int?
    var breakdown: [String: Int]?
    var discounted: Bool?
    var currency: String?
}
