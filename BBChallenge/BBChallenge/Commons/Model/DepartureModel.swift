//
//  DepartureModel.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import Foundation

/**
 Basic Departures catalog model with hardcoded destinations and geohashes
*/
struct DepartureModel: Codable, Identifiable {
    let id = UUID()
    let geohash: String
    let name: String
}

typealias Departures = [DepartureModel]

/**
 Hardcoded destinations and geohashes
*/
extension DepartureModel {
static let departures: [DepartureModel] = [
    DepartureModel(geohash:"dr5reg",name:"Montreal"),
    DepartureModel(geohash:"f25dvk",name:"New York")
    ]
}
