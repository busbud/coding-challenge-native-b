//
//  Constants.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

struct K {
    struct Identifiers {
        static var imFestivalLogo = "imFestivalLogo"
        static var imOnboarding1 = "imOnboarding1"
        static var imOnboarding2 = "imOnboarding2"
        static var imOnboarding3 = "imOnboarding3"
        static var language = "lang"
        static var currency = "currency"
        static var bouncingDot = "bouncingdot"
        static var icRight = "chevron.right"
        static var loadingAnimation = "loading"
        static var notFoundAnimation = "not-found"
    }
    
    struct Strings {
        static var titleOnboarding1 = "titleOnboarding1".localized
        static var titleOnboarding2 = "titleOnboarding2".localized
        static var titleOnboarding3 = "titleOnboarding3".localized
        static var subtitleOnboarding1 = "subtitleOnboarding1".localized
        static var subtitleOnboarding2 = "subtitleOnboarding2".localized
        static var subtitleOnboarding3 = "subtitleOnboarding3".localized
        static var letsGo = "letsGo".localized
        static var searchTitle = "searchTitle".localized
        static var searchSubtitle = "searchSubtitle".localized
        static var departure = "departure".localized
        static var leavingFrom = "leavingFrom".localized
        static var goingTo = "goingTo".localized
        static var outboundDate = "outboundDate".localized
        static var returnDate = "returnDate".localized
        static var passengerCount = "passengerCount".localized
        static var dates = "dates".localized
        static var passengers = "passengers".localized
        static var search = "search".localized
        static var resultsTitle = "resultsTitle".localized
        static var searchingBuses = "searchingBuses".localized
        static var noDeparturesFound = "noDeparturesFound".localized
        static var tryAgain = "tryAgain".localized
    }
}

extension String {
    var localized: String { NSLocalizedString(self, comment: "") }
}
