//
//  DepartureView.swift
//  busbud
//
//  Created by Nitin kachhadiya on 27/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import SwiftUI
import BBServices

struct DeparturesView: View {
    
    @ObservedObject var departures: HomeViewModel

    var body: some View {
        
        ForEach(departures.results!.departures) { departure in

            DepartureCardView(departures: self.departures,departure: departure)
            .frame(minHeight:100)
            .padding(EdgeInsets())
            .background(Color.white)
            .shadow(color: Color.black, radius: 0.4, x: 0, y: 0)
        }
    }
}

struct DepartureCardView: View {
    
    @ObservedObject var departures: HomeViewModel
    var departure: Departure
    
    
    var body: some View {
        
        VStack(alignment: .leading) {

            HStack(alignment: .top) {
                Spacer().frame(width:0)
                Text("\(self.getOperator(self.departure.operatorID).displayName)".uppercased())
                    .font(.subheadline)
                .bold()
                    .foregroundColor(Color.black)
                .padding(.leading, 15)
                .padding(.top, 5)
                Spacer()
                
                Text("\(self.departure.prices.total)".uppercased())
                    .font(.system(size: 30))
                .bold()
                    .foregroundColor(Color.black)
                .padding(.leading, 15)
                .padding(.top, 5)
                Spacer().frame(width:10)
            }
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {

                    Text("\(self.getLocation(self.departure.originLocationID))".uppercased())
                        .font(.subheadline)
                    .bold()
                        .foregroundColor(Color.black)
                    .padding(.leading, 15)
                    .padding(.top, 20)
                    
                    Text("\(self.getDateString(date: (self.getDate(date: self.departure.departureTime, timezone: self.departure.departureTimezone)!)))".uppercased())
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    .padding(.leading, 15)
                }
                
                VStack(alignment: .center) {

                    Text("12h 20m")
                        .font(.subheadline)
                    .bold()
                        .foregroundColor(Color.black)

                    Divider().padding(.top,0)
                    
                    Text("2 stops")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    .padding(.top,-5)
                }.frame(maxWidth:80)
                
                VStack(alignment: .leading) {

                    Text("\(self.getLocation(self.departure.destinationLocationID))".uppercased())
                        .font(.subheadline)
                    .bold()
                        .foregroundColor(Color.black)
                    .padding(.leading, 15)
                    .padding(.top, 20)
                    
                    Text("\(self.getDateString(date: (self.getDate(date: self.departure.arrivalTime, timezone: self.departure.arrivalTimezone)!)))".uppercased())
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    .padding(.leading, 15)
                }
                
                Spacer()
            }
            
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity)

    }
    
    func getOperator(_ id:String) -> Operator {
        
        return departures.results!.operators.first(where: {$0.id == id})!
    }
    
    func getLocation(_ id:Int) -> Location {
        
        return departures.results!.locations.first(where: {$0.id == id})!
    }
    
    func getDate(date:String, timezone: String) -> Date? {
        
        let knownTimeZones = TimeZone.knownTimeZoneIdentifiers.compactMap { TimeZone(identifier: $0) }
        let timeZone = knownTimeZones.first {
            $0.localizedName(for: .standard, locale: Locale.current) == timezone
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: date)
    }
    
    func getDateString(date:Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
}
