//
//  SearchRouter.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-09.
//

import Foundation
import RxSwift
import UIKit

class SearchRouter {
    private var topViewController: UIViewController

    init(topViewController: UIViewController) {
        self.topViewController = topViewController
    }

    func showCurrencySelection(selectedCurrencySubject: BehaviorSubject<String>) {
        let currencySelectionView = CurrencySelectionViewController()
        let currencySelectionViewModel = CurrencySelectionViewModel(selectedCurrencySubject: selectedCurrencySubject)
        currencySelectionView.viewModel = currencySelectionViewModel
        topViewController.show(currencySelectionView, sender: nil)
    }

    func showlanguageSelection(selectedLanguageSubject: BehaviorSubject<String>) {
        let languageSelectionView = LanguageSelectionViewController()
        let languageSelectionViewModel = LanguageSelectionViewModel(selectedLanguageSubject: selectedLanguageSubject)
        languageSelectionView.viewModel = languageSelectionViewModel
        topViewController.show(languageSelectionView, sender: nil)
    }
}
