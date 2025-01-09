//
//  LanguageService.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation

protocol LanguageServiceProvider {
    var currentLanguage: SupportedLanguage { get }
}

enum SupportedLanguage: String {
    case english = "en"
    case portuguese = "pt"
    
    init(localeIdentifier: String) {
        switch localeIdentifier.prefix(2) {
        case "pt": self = .portuguese
        case "en": self = .english
        default: self = .english  // Default to English
        }
    }
}

class LanguageService: LanguageServiceProvider {
    
    var currentLanguage: SupportedLanguage {
        let languageCode = Locale.current.language.languageCode?.identifier ?? "en"
        return SupportedLanguage(localeIdentifier: languageCode)
    }
}
