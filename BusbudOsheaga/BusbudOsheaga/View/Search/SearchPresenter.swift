//
//  SearchPresenter.swift
//  GoogleBooks
//
//  Created by Rafael Moraes on 17/11/18.
//  Copyright © 2018 Rafael Moraes. All rights reserved.
//

import Foundation
import PromiseKit

struct Completed : Error {}

struct SearchPresenter: SearchPresenterProtocol {

    var searchItemsChanged: (([SearchItem]) -> Void)?
    var headerChanged: ((String) -> Void)?
    var displayAlert: (((title: String, content: String)) -> Void)?
    var isLoadingResults: ((Bool) -> Void)?

    internal var searchInteractor: SearchInteractorProtocol

    init() {
        searchInteractor = SearchInteractor()
    }

    func userStartedSearch() {
        isLoadingResults?(true)
        let origin = "f244m6"
        let destination = "f25dvk"
        let date = "2020-08-28"
        searchInteractor.initSearch(with: origin , destination: destination, date: date).done {(response) in
            
            self.searchItemsChanged?(self.mapResponseToSearchItems(with: response))
            if let cities = response.cities {
                let names = cities.compactMap{ city in city.name}
                let itinerary = names.joined(separator: " -> ")
                self.headerChanged?(itinerary)
            }
            if !response.complete {
                let timeToLeave = Double(response.ttl!)
                let timestampToBackoff = Date().timeIntervalSince1970 + timeToLeave
                after(.seconds(2)).done{ _ in self.poll(seconds: 2, task: self.searchInteractor.pollSearch(with: origin, destination: destination, date: date), ttl: timestampToBackoff).catch(self.onError(error:))}
            } else {
                self.isLoadingResults?(false)
            }
        }.catch (self.onError(error:))
    }
    
    func poll(seconds time: Int, task: Promise<SearchResponse>, ttl: TimeInterval) -> Promise<Void> {
        return task.done { response in
            self.searchItemsChanged?(self.mapResponseToSearchItems(with: response))
            if response.complete || Date().timeIntervalSince1970 > ttl {
                self.isLoadingResults?(false)
            } else {
                after(.seconds(time)).done {
                    return self.poll(seconds: time, task: task, ttl: ttl).catch(self.onError(error:))
                }
            }
        }
    }
    
    func mapResponseToSearchItems(with response: SearchResponse) -> [SearchItem] {
        var searchItems = [SearchItem]()
        
        if let departureList = response.departures, let locationList = response.locations {
            for departure in departureList {
                var searchItem = SearchItem()
                if let departureLocationId = departure.departureLocationId {
                    for location in locationList {
                        if let locationId = location.identifier {
                            if locationId == departureLocationId {
                                searchItem.name = location.name
                            }
                        }
                    }
                }
                if let departureTime = departure.departureTime, let arrivalTime = departure.arrivalTime {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    if let departureDate = formatter.date(from: departureTime), let arrivalDate = formatter.date(from: arrivalTime) {
                        formatter.dateFormat = "dd MMM yyyy hh:mm a"
                        let formattedDeparture = formatter.string(from: departureDate)
                        let formattedArrival = formatter.string(from: arrivalDate)
                        searchItem.times = "\(formattedDeparture) -> \(formattedArrival)"
                    } else {
                        searchItem.times = "\(departureTime) -> \(arrivalTime)"
                    }
                }
                if let price = departure.prices?.total, let currency = departure.prices?.currency{
                    searchItem.price = "\(price) \(currency)"
                }
                searchItems.append(searchItem)
            }
        }
        return searchItems
    }
    
    func onError(error: Error) {
        self.isLoadingResults?(false)
        self.displayAlert?((title: "Error", content: error.localizedDescription))
    }
}
