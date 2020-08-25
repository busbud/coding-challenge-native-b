//
//  SearchServiceProtocol.swift
//
//  Created by Rafael Moraes on 17/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation
import PromiseKit

protocol SearchServiceProtocol: BusbudService {
    func initSearch(with origin: String, destination: String, date: String) -> (Promise<SearchResponse>)
}
