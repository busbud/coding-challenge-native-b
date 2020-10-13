//
//  LanguageViewModel.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

import Foundation
import RxCocoa
import RxSwift

class LanguageSelectionViewModel {
    
    var selectedLanguageSubject: BehaviorSubject<String>
    
    private let disposeBag = DisposeBag()

    init(selectedLanguageSubject: BehaviorSubject<String>) {
        self.selectedLanguageSubject = selectedLanguageSubject
    }

    struct LanguageSelectionViewModelInput {
        var selectedIndex: Observable<Int>
    }

    struct LanguageSelectionViewModelOutput {
        var languages: Observable<[String]>
    }

    func transform(input: LanguageSelectionViewModelInput) -> LanguageSelectionViewModelOutput {
        input.selectedIndex
            .map { Language.knowCodes[$0].uppercased() }
            .bind(onNext: { [weak self] language in
                self?.selectedLanguageSubject.onNext(language)
            })
            .disposed(by: disposeBag)
        let languages = Language.knowCodes.compactMap { return Language(value: $0)?.countryName }
        return LanguageSelectionViewModelOutput(languages: Observable.just(languages))
    }
}
