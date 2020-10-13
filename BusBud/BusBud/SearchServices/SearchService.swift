//
//  SearchService.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-07.
//

import Foundation
import RxSwift

protocol SearchService {
    func search(pathParams: SearchPathParams, query: SearchQueryParams) -> Observable<SearchResult>
}
