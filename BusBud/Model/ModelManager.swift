//
//  ModelManager.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation


/// Model manager create the list of objects of DeparturesCellViewModel for presenting on each row
class DeparturesModelManagaer {
    
    private var searchRoutesData: RouteModel?
    private var departuresListData: [DeparturesCellViewModel] = []
    

    //if Main Route doesn't exist, it will initialize that with the base result,
    //on the other hand it will update only the departures & operators
    public func addRouteData(route: RouteModel) -> [DeparturesCellViewModel] {
        if let _ = searchRoutesData {
            addDepartures(departures: route.departures)
            addOperators(operators: route.operators)
        }else{
            searchRoutesData = route
        }
        
        let data = extractDeparturesData(departures: route.departures)
        
        return data
    }
    
    public func DeleteAllData(){
        searchRoutesData = nil
        departuresListData.removeAll()
    }
    
    
    
    private func addDepartures(departures: [DepartureModel]) {
        for item in departures {
            self.searchRoutesData?.departures.append(item)
        }
    }
    
    
    private func addOperators(operators: [OperatorModel]){
        for item in operators {
            self.searchRoutesData?.operators.append(item)
        }
    }
    
    //Maping data from operators & departures for using in DeparturesCellViewModel
    private func extractDeparturesData(departures: [DepartureModel]) -> [DeparturesCellViewModel] {

        var departureCityName:String = ""
        var arrivalCityName:String = ""
        if ((searchRoutesData?.cities?.count ?? 0 ) > 1) {
             departureCityName = searchRoutesData?.cities?[0].name ?? ""
             arrivalCityName = searchRoutesData?.cities?[1].name ?? ""
        }
        
        for item in departures {
            departuresListData.append(
                DeparturesCellViewModel(
                    departureId: item.id,
                    sourceId: item.sourceID,
                    departureCityName: departureCityName,
                    arrivalCityName: arrivalCityName,
                    operatorId: item.operatorID,
                    date: getDate(inputDate: item.departureTime),
                    price: toCurrencyFormat(price: ("\(item.prices?.total ?? 0)"), currencyCode: (item.prices?.currency ?? "") ),
                    hasDiscount: item.prices?.discounted ?? false,
                    departureTime: getTime(inputDate: item.departureTime),
                    arrivalTime: getTime(inputDate: item.arrivalTime),
                    arrivalDate: item.arrivalTime,
                    departureTerminal: extractLocationName(locationId: item.originLocationID),
                    arrivalTerminal: extractLocationName(locationId: item.destinationLocationID),
                    busCompanyName: extractCompanyName(operatorId: item.operatorID),
                    seatsAvailable: item.availableSeats,
                    durationTime: getDuration(duration: item.duration),
                    isNextDay: isNextDay(arrivalDate: item.arrivalTime, departureDate: item.departureTime),
                    facilities: item.amenities )
            )
            
        }
        
        return departuresListData
    }
    
    //MARK: - Get correct date format
    private func getDate(inputDate:String, formatter:String = "dd MMM yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        guard let oldDate = dateFormatter.date(from: inputDate) else{
            return inputDate
        }

        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = formatter

        return convertDateFormatter.string(from: oldDate)
    }
    
    
    //MARK: is it going for the Next day
    private func isNextDay(arrivalDate:String , departureDate:String) -> Bool{
        
        let arrivalDay = getDate(inputDate: arrivalDate, formatter: "dd")
        let departureDay =  getDate(inputDate: departureDate, formatter: "dd")
        
        return arrivalDay != departureDay
    }
    
    
    //MARK: get correct time from Dates
    private func getTime(inputDate:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        guard let oldDate = dateFormatter.date(from: inputDate) else{
            return inputDate
        }

        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "HH:mm"

        return convertDateFormatter.string(from: oldDate)
    }
    
    
    //MARK: filtering location name from locations with id
    private func extractLocationName(locationId: Int) -> String {
        var result = ""
    
        if let locations = searchRoutesData?.locations {
            result = locations.filter({$0.id == locationId}).first?.name ?? ""
        }
        
        return result
    }
    
    
    //MARK: filtering company name from operatorId with ID
    private func extractCompanyName(operatorId: String) -> String {
        var result = ""
    
        if let operators = searchRoutesData?.operators {
            result = operators.filter({$0.id == operatorId}).first?.name ?? ""
        }
        
        return result
    }
    

    //MARK: calculating the duration of a trip
    private func getDuration(duration:Int) -> String {
        
        let hours = (duration/60)
        let minuts = (duration % 60)
        
        if minuts == 0 {
            return ("\(hours)h")
        }
        
        return ("\(hours)h \(minuts)m")
        
    }
    
    
    //MARK: formatting the price by using the currancyCode
    private func toCurrencyFormat(price:String, currencyCode: String) -> String {
        
        if let intValue = Int(price){
            let myDouble = (Double(intValue)/100)
            let currencyFormatter = NumberFormatter()
            currencyFormatter.usesGroupingSeparator = true
            currencyFormatter.numberStyle = .currency
            currencyFormatter.currencyCode = currencyCode
            
            if let priceString = currencyFormatter.string(from: NSNumber(value: myDouble)) {
                return priceString
            }
            
        }
        return ""
    }
}




