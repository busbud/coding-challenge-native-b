//
//  DistanceFormatter.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//
import Foundation

final class DistanceFormatter {
    
    static var formatter: MeasurementFormatter {
        let f = MeasurementFormatter()
        f.unitOptions = .providedUnit
        f.unitStyle = .short
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.numberStyle = .decimal
        f.numberFormatter = numberFormatter
        
        return f
    }
    
    static func format(meters: Double, locale: Locale = .current) -> String {
        let distanceInKilometers = Measurement(value: meters / 1000, unit: UnitLength.kilometers)
        formatter.locale = locale
        
        if locale.usesImperialUnits {
            let distanceInMiles = distanceInKilometers.converted(to: .miles)
            return formatter.string(from: distanceInMiles)
        } else {
            return formatter.string(from: distanceInKilometers)
        }
    }

}

extension Locale {
    var usesImperialUnits: Bool {
        guard let measurementSystem = (self as NSLocale).object(forKey: NSLocale.Key.measurementSystem) as? String else {
            return false
        }
        
        return measurementSystem == "U.S." || measurementSystem == "U.K."
    }
}
