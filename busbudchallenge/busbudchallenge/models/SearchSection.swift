//
//  SearchItems.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct SearchSection {
    var key: String
    var value: [SearchSectionItem]
}

// Dummie objects, locations should be pulled from API, this is only for testing proposes
extension SearchSection {
    static let sections: [SearchSection] = [
        SearchSection(key: K.Strings.departure, value: SearchSectionItem.departure),
        SearchSection(key: K.Strings.dates, value: SearchSectionItem.dates),
        SearchSection(key: K.Strings.passengers, value: SearchSectionItem.passengers)
    ]
}
