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

    private let disposeBag = DisposeBag()
    
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
        input.selectedIndex
            .map { Currency.allCases[$0].code.uppercased() }
            .bind(onNext: { [weak self] currency in
                self?.selectedCurrencySubject.onNext(currency)
            })
            .disposed(by: disposeBag)
        let allCurrencies = Currency.allCases.map { return $0.rawValue }
        return CurrencySelectionViewModelOutput(currencies: Observable.just(allCurrencies))
    }
}
