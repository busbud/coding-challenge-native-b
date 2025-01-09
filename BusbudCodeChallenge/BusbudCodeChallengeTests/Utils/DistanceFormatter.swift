//
//  DistanceFormatter.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//


import Foundation
import Testing
@testable import BusbudCodeChallenge

struct DistanceFormatterTests {
    
    @Test
    func testFormatInKilometersForMetricLocale() {
        let locale = Locale(identifier: "fr_FR")  // French locale uses metric system
        let formattedDistance = DistanceFormatter.format(meters: 1000, locale: locale)
        
        #expect(formattedDistance.contains("km"), "Expected metric units (km)")
        #expect(formattedDistance == "1km" || formattedDistance == "1,00km")
    }
    
    @Test
    func testFormatInMilesForImperialLocale() {
        let locale = Locale(identifier: "en_US")  // U.S. locale uses imperial system
        let formattedDistance = DistanceFormatter.format(meters: 1609344, locale: locale)

        #expect(formattedDistance.contains("mi"), "Expected imperial units (mi)")
        #expect(formattedDistance == "1000mi" || formattedDistance == "1,000mi")
    }
    
    @Test
    func testZeroDistance() {
        let locale = Locale(identifier: "en_US")
        let formattedDistance = DistanceFormatter.format(meters: 0, locale: locale)
        
        #expect(formattedDistance == "0mi" || formattedDistance == "0.00mi", "Expected zero distance")
    }
}

