//
//  SearchViewModel.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-09.
//

import Foundation
import RxCocoa
import RxSwift

class SearchViewModel {
    var router: SearchRouter?

    private let path = SearchPathParams(origin: "f2m673", destination: "f25dvk", date: "2021-01-02")
    private var disposeBag = DisposeBag()
    private var searchService: SearchService

    private let activeWaitingMode = BehaviorSubject<Bool>(value: false)
    private let searchResultSubject = PublishSubject<[SearchResultViewData]>()

    private var searchQuery = SearchQueryParams(adults: 1, childs: 0, seniors: 0, lang: "EN", currency: "CAD", index: nil)
    private lazy var langSubject = BehaviorSubject(value: searchQuery.lang)
    private lazy var currencySubject = BehaviorSubject(value: searchQuery.currency)
    private lazy var adultSubject = BehaviorSubject(value: searchQuery.adults)
    private lazy var childSubject = BehaviorSubject(value: searchQuery.childs)
    private lazy var seniorSubject = BehaviorSubject(value: searchQuery.seniors)

    private var searchResults: [SearchResultViewData] = []

    init(searchService: SearchService) {
        self.searchService = searchService
        self.updateQuery()
    }

    struct SearchViewModelInput {
        var search: Observable<()>
        var selectLang: Observable<()>
        var selectCurrency: Observable<()>

        var selectAdult: Observable<Int>
        var selectChild: Observable<Int>
        var selectSenior: Observable<Int>
    }

    struct SearchViewModelOutput {
        var searchResult: Observable<[SearchResultViewData]>
        var lang: Driver<String>
        var currency: Driver<String>

        var adult: Driver<String>
        var child: Driver<String>
        var senior: Driver<String>
        var waitingMode: Driver<Bool>
    }

    private func updateQuery() {
        adultSubject.subscribe { [weak self] in self?.searchQuery.adults = $0 }.disposed(by: disposeBag)
        childSubject.subscribe { [weak self] in self?.searchQuery.childs = $0 }.disposed(by: disposeBag)
        seniorSubject.subscribe { [weak self] in self?.searchQuery.seniors = $0 }.disposed(by: disposeBag)
        langSubject.subscribe { [weak self] in self?.searchQuery.lang = $0 }.disposed(by: disposeBag)
        currencySubject.subscribe { [weak self] in self?.searchQuery.currency = $0 }.disposed(by: disposeBag)
    }

    private func search() {
        searchService.search(pathParams: path,
                             query: searchQuery)
            .subscribe(onNext: { [weak self] result in
                guard let self = self else { return }
                let viewData = self.searchResultViewData(from: result)
                self.searchResults.append(contentsOf: self.searchResultViewData(from: result))
                if !result.complete && viewData.count > 0 {
                    print(self.searchResults.count)
                    self.searchQuery.index = self.searchResults.count
                    self.search()
                } else {
                    self.activeWaitingMode.onNext(false)
                    self.searchResultSubject.onNext(self.searchResults)
                }
            }).disposed(by: disposeBag)
    }

    private func resetSearch() {
        self.searchResults = []
        self.searchQuery.index = nil
        self.activeWaitingMode.onNext(true)
    }

    func searchResultViewData(from result: SearchResult) -> [SearchResultViewData] {
        return result.departures.map { departure in
            let locationOrigin = result.locations.first(where: { $0.id == departure.originLocationID })?.name ?? ""
            let locationDestination = result.locations.first(where: { $0.id == departure.destinationLocationID })?.name ?? ""
            return SearchResultViewData(departureTime: departure.departureTime.formatedDate ?? "",
                                        arrivalTime: departure.arrivalTime.formatedDate ?? "",
                                        locationName: locationOrigin + " -> " + locationDestination,
                                        price: "\(departure.prices.total)")
        }
    }

    func transform(input: SearchViewModelInput) -> SearchViewModelOutput {
        input.selectAdult.bind(to: adultSubject).disposed(by: disposeBag)
        input.selectChild.bind(to: childSubject).disposed(by: disposeBag)
        input.selectSenior.bind(to: seniorSubject).disposed(by: disposeBag)
        input.search.bind(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.resetSearch()
            self.search()
        }).disposed(by: disposeBag)

        input.selectLang.bind(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.router?.showlanguageSelection(selectedLanguageSubject: self.langSubject)
        }).disposed(by: disposeBag)

        input.selectCurrency.bind(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.router?.showCurrencySelection(selectedCurrencySubject: self.currencySubject)
        }).disposed(by: disposeBag)

        let waitingMode = activeWaitingMode.startWith(false).asDriver(onErrorJustReturn: false)
        return SearchViewModelOutput(searchResult: searchResultSubject,
                                     lang: langSubject.asDriver(onErrorJustReturn: "EN"),
                                     currency: currencySubject.asDriver(onErrorJustReturn: "CAD"),
                                     adult: adultSubject.map { "\($0)" }.asDriver(onErrorJustReturn: ""),
                                     child: childSubject.map { "\($0)" }.asDriver(onErrorJustReturn: ""),
                                     senior: seniorSubject.map { "\($0)" }.asDriver(onErrorJustReturn: ""),
                                     waitingMode: waitingMode)
    }
}
