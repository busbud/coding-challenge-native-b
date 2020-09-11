//
//  DepartureRow.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI

/**
 Departures row  view.
 Card styles for the tavleview cells.
*/
struct DepartureRow: View {
    /// View model with all the sdepartures datasources
    private let viewModel: DepartureRowViewModel
    
    init(viewModel: DepartureRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Spacer()
                    Text("\(viewModel.departureTime)")
                    .font(.subheadline)
                    Spacer()
                    Text("\(viewModel.arrivalTime)")
                    .font(.subheadline)
                    Spacer()
                }.padding(.leading, 8)
                
                VStack(alignment: .leading) {
                    Text("\(viewModel.locationDepartureAddress)")
                    .font(.subheadline)
                    .lineLimit(nil)
                    Spacer()
                    Text("\(viewModel.locationArrivalAddress)")
                    .font(.subheadline)
                    .lineLimit(nil)
                }
                Spacer()
                VStack {
                    Spacer()
                    Text("Price")
                    .font(.subheadline)
                Text("$\(viewModel.price)")
                    .font(.title)
                    Spacer()
                }.padding(.trailing, 8)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal,0)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 2)
        )
        
        .shadow(color: Color.gray.opacity(0.4),
        radius: 6, x: 1, y: 2)
    }
}

// Simple preview with default data

struct DepartureRow_Previews: PreviewProvider {
    static var previews: some View {
        let location = Location(
            id: 5178,
            cityID: "375dd587-9001-acbd-84a4-683deda84183",
            name: "New York City",
            address: ["349 W 31st St (between 8th & 9th Avenue)","New York, NY 10001"],
            type: TypeEnum.busStation,
            lat: 40.750996,
            lon: -73.996178,
            geohash: "dr5ru4mxu")
        let economyClass = EconomyClass(
            displayName: "Economy",
            wifi: true,
            toilet: true,
            ac: true,
            food: false,
            refreshment: false,
            powerOutlets: true,
            tv: false,
            busAttendant: false,
            legRoom: false)
        let prices = Prices(
            total: 5200,
            breakdown: Breakdown(base: 5200),
            categories: Categories(),
            discounted: false)
        let departure = Departure(
            id: "7c5dd26a",
            sourceID: 155,
            checkoutType: "new",
            operatorID: "bfc27cd544ca49c18d000f2bc00c58c0",
            originLocationID: 1942,
            destinationLocationID: 1938,
            departureClass: "Economy",
            className: "Economy",
            amenities: economyClass,
            availableSeats: 55,
            prices: prices,
            ticketTypes: ["print"],
            departureTimezone: "America/New_York",
            arrivalTimezone: "America/Montreal",
            departureTime: Date(),
            arrivalTime: Date())
        let terms = Terms(
            refund: false,
            exchange: true,
            bagAllowed: true,
            pieceOfID: false,
            boardingRequirement: "printed_tkt",
            extraBagPolicy: true,
            useNewTicket: false,
            exchangeCutoff: 24,
            nbCheckedBags: 1,
            kgByBag: 25,
            nbCarryOn: 1,
            extraBagCost: 1500)
        let operatorAmenities = OperatorAmenities(classes:
            Classes(normal: economyClass, economy:economyClass)
        )
        let providerOperator = Operator(
            id: "bfc27cd544ca49c18d000f2bc00c58c0",
            sourceID: 155,
            profileID: 111,
            name: "Greyhound",
            url: nil,
            logoURL: "https://busbud-pubweb-assets-staging.global.ssl.fastly.net/images-service/operator-logos/greyhound.png?hash=1{&height,width}",
            displayName: "Greyhound",
            sellable: true,
            fuzzyPrices: false,
            sellTicketsCutoff: SellTicketsCutoff(hours: 1),
            amenities: operatorAmenities,
            source: "greyhound_us",
            referralDeal: false,
            displayURL: nil,
            fraudCheck: "iovation",
            terms: terms)
        let viewModel = DepartureRowViewModel(
            locationOrigin: location,
            locationDestination: location,
            departure: departure,
            providerOperator: providerOperator)
        return DepartureRow(viewModel: viewModel)
    }
}
