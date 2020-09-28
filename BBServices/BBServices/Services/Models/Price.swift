//
//  Price.swift
//  BBServices
//
//  Created by Nitin kachhadiya on 28/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation

// MARK: - Prices
public struct Price: Hashable, Codable {
    public let total: Int
    public let breakdown: Breakdown
    public let categories: Categories
    public let discounted: Bool
    
    private enum CodingKeys: String, CodingKey {
        case total
        case breakdown
        case categories
        case discounted
    }
}

// MARK: - Breakdown
public struct Breakdown: Hashable, Codable {
    let base: Int
}

// MARK: - Categories
public struct Categories: Hashable, Codable {
}
