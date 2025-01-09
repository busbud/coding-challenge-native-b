//
//  MockLanguageService.swift
//  BusbudCodeChallenge
//
//  Created by Luiz Rath on 1/9/25.
//

import Foundation
@testable import BusbudCodeChallenge

class MockLanguageService: LanguageServiceProvider {
    var currentLanguage: SupportedLanguage = .english
}
