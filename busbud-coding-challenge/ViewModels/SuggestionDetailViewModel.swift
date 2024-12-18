//
//  SuggestionDetailViewModel.swift
//  busbud-coding-challenge
//
//  Created by Spencer Diniz on 17/12/24.
//

import Foundation
import CoreLocation

class SuggestionDetailViewModel: ObservableObject {
    private let suggestion: Suggestion

    init(suggestion: Suggestion) {
        self.suggestion = suggestion
    }

    var city: String {
        return suggestion.cityName
    }

    var region: String {
        return suggestion.regionName
    }

    var country: String {
        return suggestion.countryName
    }

    var distance: String {
        suggestion.formattedDistance
    }

    var geohash: String {
        return suggestion.geohash
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: suggestion.lat, longitude: suggestion.lon)
    }
}
