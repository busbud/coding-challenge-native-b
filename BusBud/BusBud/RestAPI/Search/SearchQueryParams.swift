//
//  SearchQueryParams.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-07.
//

import Foundation

struct SearchQueryParams {
    var adults: Int
    var childs: Int
    var seniors: Int
    var lang: String
    var currency: String
    var index: Int?

    var dictionary: [String: Any] {
        var queryParams: [String: Any] = ["adults": adults,
                                          "childs": childs,
                                          "seniors": seniors,
                                          "lang": lang,
                                          "currency": currency]
        if let currentIndex = index {
            queryParams["index"] = currentIndex
        }
        return queryParams
    }
}
