//
//  CLLocation + Extensions.swift
//  BusBudiOSChallenge
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 17/12/24.
//

import CoreLocation

extension CLLocation {
    func distance(to city: City) -> Double {
        let earthRadiusInKm = 6371.0
        
        let deltaLat = (city.latitude - self.coordinate.latitude).degreesToRadians
        let deltaLon = (city.longitude - self.coordinate.longitude).degreesToRadians
        
        let a = sin(deltaLat / 2) * sin(deltaLat / 2) +
                cos(self.coordinate.latitude.degreesToRadians) * cos(city.latitude.degreesToRadians) *
                sin(deltaLon / 2) * sin(deltaLon / 2)
        
        let c = 2 * atan2(sqrt(a), sqrt(1 - a))
        
        return earthRadiusInKm * c
    }
}
