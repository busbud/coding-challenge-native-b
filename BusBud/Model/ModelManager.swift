//
//  ModelManager.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/17/20.
//

import Foundation


class DeparturesModelManagaer {
    
    static var shared = DeparturesModelManagaer()
    
    private var searchRoutesData: RouteModel?
    private var departuresListData: [DeparturesCellViewModel] = []
    

    public func addRouteData(route: RouteModel) -> [DeparturesCellViewModel] {
        if let _ = searchRoutesData {
            addDepartures(departures: route.departures)
            addOperators(operators: route.operators)
        }else{
            searchRoutesData = route
            addDepartures(departures: route.departures)
            addOperators(operators: route.operators)
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
                    price: ("\(item.prices?.total ?? 0)").toCurrencyFormat(currencyCode: (item.prices?.currency ?? "")),
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
    
    
    private func isNextDay(arrivalDate:String , departureDate:String) -> Bool{
        
        let arrivalDay = getDate(inputDate: arrivalDate, formatter: "dd")
        let departureDay =  getDate(inputDate: departureDate, formatter: "dd")
        
        return arrivalDay != departureDay
    }
    
    
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
    
    
    private func extractLocationName(locationId: Int) -> String {
        var result = ""
    
        if let locations = searchRoutesData?.locations {
            result = locations.filter({$0.id == locationId}).first?.name ?? ""
        }
        
        return result
    }
    
    
    private func extractCompanyName(operatorId: String) -> String {
        var result = ""
    
        if let operators = searchRoutesData?.operators {
            result = operators.filter({$0.id == operatorId}).first?.name ?? ""
        }
        
        return result
    }
    

    
    private func getDuration(duration:Int) -> String {
        
        let hours = (duration/60)
        let minuts = (duration % 60)
        
        if minuts == 0 {
            return ("\(hours)h")
        }
        
        return ("\(hours)h \(minuts)m")
        
    }
    

}


extension String{
    func toCurrencyFormat(currencyCode: String) -> String {

        if let intValue = Int(self){
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
