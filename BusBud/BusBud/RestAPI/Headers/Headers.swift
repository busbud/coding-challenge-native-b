//
//  Headers.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-07.
//

import Foundation

struct Headers {
    static var defaultV2Header: [String: String] {
        return ["Accept": "application/vnd.busbud+json;version=2;profile=https://schema.busbud.com/v2/",
                "X-Busbud-Token": "PARTNER_BaASYYHxTxuOINEOMWq5GA"]
    }
}
