//
//  Origin.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

protocol OriginDefinition {
    var name: String? { get }
    var latitude: Double { get }
    var longitude: Double { get }
}

struct Origin: OriginDefinition {
    let name: String?
    let latitude: Double
    let longitude: Double
}
