//
//  CurrencySelectionViewModel.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import Foundation
import RxCocoa
import RxSwift

class CurrencySelectionViewModel {
    var selectedCurrencySubject: BehaviorSubject<String>

    init(selectedCurrencySubject: BehaviorSubject<String>) {
        self.selectedCurrencySubject = selectedCurrencySubject
    }

    struct CurrencySelectionViewModelInput {
        var selectedIndex: Observable<Int>
    }

    struct CurrencySelectionViewModelOutput {
        var currencies: Observable<[String]>
    }

    func transform(input: CurrencySelectionViewModelInput) -> CurrencySelectionViewModelOutput {
        _ = input.selectedIndex
            .map { Currency.allCases[$0].code.uppercased() }
            .bind(onNext: { [weak self] currency in
                self?.selectedCurrencySubject.onNext(currency)
            })
        let allCurrencies = Currency.allCases.map { return $0.rawValue }
        return CurrencySelectionViewModelOutput(currencies: Observable.just(allCurrencies))
    }
}
