//
//  DeparturesViewModel.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI
import Combine

/**
 Departures list view model.
 Defines all the datasources for the departures,
 Holds the state of the departures and inject the departure detail view.
*/
class DeparturesViewModel: ObservableObject {
    
    /// Store the flag for loading
    @Published var loading = false
    /// Store the flag for sucription completed
    @Published var completed = true
    
    /// List of departures
    @Published var departuresDataSource: [DepartureRowViewModel] = []
    /// Selected of departure
    let departureCriteria: DeparturesCriteria

    /// Remote Busbud API Fetcher
    private let bbAPIFetcher: BBAPIFetchable?
    /// Set of suscriptions for cleaning
    private var disposables = Set<AnyCancellable>()

    /// Custom queue to search departures
    private var scheduler: DispatchQueue?
    
    /// Inject departureCriteria, Busbud API Fetcher and a custom queue to search departures
    init(criteria departureCriteria: DeparturesCriteria, apiFetcher bbAPIFetcher: BBAPIFetchable?,
         scheduler: DispatchQueue = DispatchQueue(label: "DeparturesViewModel", qos: .userInitiated)
    ) {
        loading = true
        completed = false
        self.bbAPIFetcher = bbAPIFetcher
        self.departureCriteria = departureCriteria
        self.scheduler = scheduler
        self.fetchDepartures()
    }
    
    /// Search departures
    func fetchDepartures() {
        self.scheduler?.async {
            self.bbAPIFetcher?.departures(withCriteria: self.departureCriteria)
            .map { response in
                response.departures.map { departure in
                    DepartureRowViewModel(
                        locationOrigin: response.locations
                            .filter { $0.id == departure.originLocationID }.first,
                        locationDestination: response.locations
                            .filter { $0.id == departure.destinationLocationID }.first,
                        departure: departure,
                        providerOperator: response.operators
                            .filter {$0.id == departure.operatorID }.first)
                }
            }
            //.map(Array.removeDuplicates)
            .receive(on: DispatchQueue.main)
            .sink(
            // on complete clean flags
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.departuresDataSource = []
                case .finished:
                    break
                }
                self.loading = false
                self.completed = true
            },
            // on value received update departures data source
            receiveValue: { [weak self] departures in
                guard let self = self else { return }
                if ( !departures.isEmpty) {
                    self.departuresDataSource = departures
                }
                // Uncomment for testing for empty results
//                else {
//                    self.departuresDataSource = [
//                        DepartureRowViewModel(
//                            locationOrigin: Location(id: 5178, cityID: "375dd587-9001-acbd-84a4-683deda84183", name: "New York City", address: ["349 W 31st St (between 8th & 9th Avenue)","New York, NY 10001"], type: TypeEnum.busStation, lat: 40.750996, lon: -73.996178, geohash: "dr5ru4mxu"),
//                        locationDestination: Location(id: 5178, cityID: "375dd587-9001-acbd-84a4-683deda84183", name: "New York City", address: ["349 W 31st St (between 8th & 9th Avenue)","New York, NY 10001"], type: TypeEnum.busStation, lat: 40.750996, lon: -73.996178, geohash: "dr5ru4mxu"),
//                        departure: Departure(id: "7c5dd26a", sourceID: 155, checkoutType: "new", operatorID: "bfc27cd544ca49c18d000f2bc00c58c0", originLocationID: 1942, destinationLocationID: 1938, departureClass: "Economy", className: "Economy", amenities: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false), availableSeats: 55, prices: Prices(total: 5200, breakdown: Breakdown(base: 5200), categories: Categories(), discounted: false), ticketTypes: ["print"], departureTimezone: "America/New_York", arrivalTimezone: "America/Montreal", departureTime: Date(), arrivalTime: Date()),
//                        providerOperator: Operator(id: "bfc27cd544ca49c18d000f2bc00c58c0", sourceID: 155, profileID: 111, name: "Greyhound", url: nil, logoURL: "https://busbud-pubweb-assets-staging.global.ssl.fastly.net/images-service/operator-logos/greyhound.png?hash=1{&height,width}", displayName: "Greyhound", sellable: true, fuzzyPrices: false, sellTicketsCutoff: SellTicketsCutoff(hours: 1), amenities: OperatorAmenities(classes: Classes(normal: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false), economy: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false))), source: "greyhound_us", referralDeal: false, displayURL: nil, fraudCheck: "iovation", terms: Terms(refund: false, exchange: true, bagAllowed: true, pieceOfID: false, boardingRequirement: "printed_tkt", extraBagPolicy: true, useNewTicket: false, exchangeCutoff: 24, nbCheckedBags: 1, kgByBag: 25, nbCarryOn: 1, extraBagCost: 1500))),
//                        DepartureRowViewModel(
//                                                   locationOrigin: Location(id: 5178, cityID: "375dd587-9001-acbd-84a4-683deda84183", name: "New York City", address: ["349 W 31st St (between 8th & 9th Avenue)","New York, NY 10001"], type: TypeEnum.busStation, lat: 40.750996, lon: -73.996178, geohash: "dr5ru4mxu"),
//                                               locationDestination: Location(id: 5178, cityID: "375dd587-9001-acbd-84a4-683deda84183", name: "New York City", address: ["349 W 31st St (between 8th & 9th Avenue)","New York, NY 10001"], type: TypeEnum.busStation, lat: 40.750996, lon: -73.996178, geohash: "dr5ru4mxu"),
//                                               departure: Departure(id: "7c5dd26a", sourceID: 155, checkoutType: "new", operatorID: "bfc27cd544ca49c18d000f2bc00c58c0", originLocationID: 1942, destinationLocationID: 1938, departureClass: "Economy", className: "Economy", amenities: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false), availableSeats: 55, prices: Prices(total: 5200, breakdown: Breakdown(base: 5200), categories: Categories(), discounted: false), ticketTypes: ["print"], departureTimezone: "America/New_York", arrivalTimezone: "America/Montreal", departureTime: Date(), arrivalTime: Date()),
//                                               providerOperator: Operator(id: "bfc27cd544ca49c18d000f2bc00c58c0", sourceID: 155, profileID: 111, name: "Greyhound", url: nil, logoURL: "https://busbud-pubweb-assets-staging.global.ssl.fastly.net/images-service/operator-logos/greyhound.png?hash=1{&height,width}", displayName: "Greyhound", sellable: true, fuzzyPrices: false, sellTicketsCutoff: SellTicketsCutoff(hours: 1), amenities: OperatorAmenities(classes: Classes(normal: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false), economy: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false))), source: "greyhound_us", referralDeal: false, displayURL: nil, fraudCheck: "iovation", terms: Terms(refund: false, exchange: true, bagAllowed: true, pieceOfID: false, boardingRequirement: "printed_tkt", extraBagPolicy: true, useNewTicket: false, exchangeCutoff: 24, nbCheckedBags: 1, kgByBag: 25, nbCarryOn: 1, extraBagCost: 1500))),
//                        DepartureRowViewModel(
//                                                   locationOrigin: Location(id: 5178, cityID: "375dd587-9001-acbd-84a4-683deda84183", name: "New York City", address: ["349 W 31st St (between 8th & 9th Avenue)","New York, NY 10001"], type: TypeEnum.busStation, lat: 40.750996, lon: -73.996178, geohash: "dr5ru4mxu"),
//                                               locationDestination: Location(id: 5178, cityID: "375dd587-9001-acbd-84a4-683deda84183", name: "New York City", address: ["349 W 31st St (between 8th & 9th Avenue)","New York, NY 10001"], type: TypeEnum.busStation, lat: 40.750996, lon: -73.996178, geohash: "dr5ru4mxu"),
//                                               departure: Departure(id: "7c5dd26a", sourceID: 155, checkoutType: "new", operatorID: "bfc27cd544ca49c18d000f2bc00c58c0", originLocationID: 1942, destinationLocationID: 1938, departureClass: "Economy", className: "Economy", amenities: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false), availableSeats: 55, prices: Prices(total: 5200, breakdown: Breakdown(base: 5200), categories: Categories(), discounted: false), ticketTypes: ["print"], departureTimezone: "America/New_York", arrivalTimezone: "America/Montreal", departureTime: Date(), arrivalTime: Date()),
//                                               providerOperator: Operator(id: "bfc27cd544ca49c18d000f2bc00c58c0", sourceID: 155, profileID: 111, name: "Greyhound", url: nil, logoURL: "https://busbud-pubweb-assets-staging.global.ssl.fastly.net/images-service/operator-logos/greyhound.png?hash=1{&height,width}", displayName: "Greyhound", sellable: true, fuzzyPrices: false, sellTicketsCutoff: SellTicketsCutoff(hours: 1), amenities: OperatorAmenities(classes: Classes(normal: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false), economy: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false))), source: "greyhound_us", referralDeal: false, displayURL: nil, fraudCheck: "iovation", terms: Terms(refund: false, exchange: true, bagAllowed: true, pieceOfID: false, boardingRequirement: "printed_tkt", extraBagPolicy: true, useNewTicket: false, exchangeCutoff: 24, nbCheckedBags: 1, kgByBag: 25, nbCarryOn: 1, extraBagCost: 1500))),
//                        DepartureRowViewModel(
//                                                   locationOrigin: Location(id: 5178, cityID: "375dd587-9001-acbd-84a4-683deda84183", name: "New York City", address: ["349 W 31st St (between 8th & 9th Avenue)","New York, NY 10001"], type: TypeEnum.busStation, lat: 40.750996, lon: -73.996178, geohash: "dr5ru4mxu"),
//                                               locationDestination: Location(id: 5178, cityID: "375dd587-9001-acbd-84a4-683deda84183", name: "New York City", address: ["349 W 31st St (between 8th & 9th Avenue)","New York, NY 10001"], type: TypeEnum.busStation, lat: 40.750996, lon: -73.996178, geohash: "dr5ru4mxu"),
//                                               departure: Departure(id: "7c5dd26a", sourceID: 155, checkoutType: "new", operatorID: "bfc27cd544ca49c18d000f2bc00c58c0", originLocationID: 1942, destinationLocationID: 1938, departureClass: "Economy", className: "Economy", amenities: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false), availableSeats: 55, prices: Prices(total: 5200, breakdown: Breakdown(base: 5200), categories: Categories(), discounted: false), ticketTypes: ["print"], departureTimezone: "America/New_York", arrivalTimezone: "America/Montreal", departureTime: Date(), arrivalTime: Date()),
//                                               providerOperator: Operator(id: "bfc27cd544ca49c18d000f2bc00c58c0", sourceID: 155, profileID: 111, name: "Greyhound", url: nil, logoURL: "https://busbud-pubweb-assets-staging.global.ssl.fastly.net/images-service/operator-logos/greyhound.png?hash=1{&height,width}", displayName: "Greyhound", sellable: true, fuzzyPrices: false, sellTicketsCutoff: SellTicketsCutoff(hours: 1), amenities: OperatorAmenities(classes: Classes(normal: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false), economy: EconomyClass(displayName: "Economy", wifi: true, toilet: true, ac: true, food: false, refreshment: false, powerOutlets: true, tv: false, busAttendant: false, legRoom: false))), source: "greyhound_us", referralDeal: false, displayURL: nil, fraudCheck: "iovation", terms: Terms(refund: false, exchange: true, bagAllowed: true, pieceOfID: false, boardingRequirement: "printed_tkt", extraBagPolicy: true, useNewTicket: false, exchangeCutoff: 24, nbCheckedBags: 1, kgByBag: 25, nbCarryOn: 1, extraBagCost: 1500)))
//                    ]
//                }
                self.loading = true
            }).store(in: &self.disposables)
        }
    }
    
}
