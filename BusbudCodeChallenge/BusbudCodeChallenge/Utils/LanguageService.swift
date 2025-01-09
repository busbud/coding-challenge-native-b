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

final class LanguageService: LanguageServiceProvider {
    private let locale: Locale

    init(locale: Locale = .current) {
        self.locale = locale
    }
    
    var currentLanguage: SupportedLanguage {
        let languageCode = locale.language.languageCode?.identifier ?? "en"
        return SupportedLanguage(localeIdentifier: languageCode)
    }
}
