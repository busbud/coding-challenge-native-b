//
//  LanguageServiceTests.swift
//  BusbudCodeChallengeTests
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
import Testing
@testable import BusbudCodeChallenge

struct LanguageServiceTests {
    
    @Test
    func testEnglishLocale() {
        let mockLocale = Locale(identifier: "en_US")
        let languageService = LanguageService(locale: mockLocale)
        
        let result = languageService.currentLanguage
        
        #expect(result == .english)  // Expect English for en_US
    }
    
    @Test
    func testPortugueseLocale() {
        let mockLocale = Locale(identifier: "pt_BR")
        let languageService = LanguageService(locale: mockLocale)
        
        let result = languageService.currentLanguage
        
        #expect(result == .portuguese)  // Expect Portuguese for pt_BR
    }
    
    @Test
    func testDefaultToEnglishForUnsupportedLocale() {
        let mockLocale = Locale(identifier: "fr_FR")  // French, which is unsupported
        let languageService = LanguageService(locale: mockLocale)
        
        let result = languageService.currentLanguage
        
        #expect(result == .english)  // Expect English as default
    }
}

