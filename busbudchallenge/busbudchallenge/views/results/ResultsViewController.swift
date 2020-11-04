//
//  ResultsViewController.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import UIKit
import Lottie
import Combine

class ResultsViewController: UIViewController {

    private var resultsView: ResultsView = {
        let rv = ResultsView()
        rv.isHidden = true
        return rv
    }()
    
    private lazy var noResultsView: ResultsEmptyView = {
        let re = ResultsEmptyView()
        re.delegate = self
        re.backgroundColor = .systemGroupedBackground
        re.alpha = 0
        return re
    }()
    
    private var loadingView: ResultsLoadingView = {
        let rlv = ResultsLoadingView()
        rlv.hero.isEnabled = true
        rlv.backgroundColor = .systemGroupedBackground
        return rlv
    }()
    
    private var viewModel: ResultsViewModel
    private var subscriber: AnyCancellable?
    
    init(with viewModel: ResultsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        observeViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchResults()
    }

}

extension ResultsViewController: ResultsEmptyViewDelegate {
    func onTryAgainButtonPressed() {
        // the fetch again method is meant to be used as showcase demostration
        // just in case the events' date doesn't display any results
        // so we can retry the request with a current date and get results
        viewModel.fetchAgain()
        loadingView.alpha = 1
        noResultsView.alpha = 0
    }
}

private extension ResultsViewController {
    func setupView() {
        hero.isEnabled = true
        navigationItem.title = K.Strings.resultsTitle
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(resultsView)
        view.addSubview(loadingView)
        view.addSubview(noResultsView)
    }
    
    func setupConstraints() {
        loadingView.snp.makeConstraints { $0.margins.equalTo(view.safeAreaLayoutGuide) }
        noResultsView.snp.makeConstraints { $0.margins.equalTo(view.safeAreaLayoutGuide) }
        resultsView.snp.makeConstraints{ $0.margins.equalTo(view.safeAreaLayoutGuide) }
    }
    
    func observeViewModel() {
        subscriber = viewModel.responseSubject.sink { (resultCompletion) in
            switch resultCompletion {
            case .failure(let error):
                print(error)
            default: break
            }
        } receiveValue: { (response) in
            mainQueue {
                self.resultsView.data = response
                self.animateViews(empty: response.departures?.isEmpty ?? false)
            }
        }
    }
    
    func animateViews(empty: Bool) {
        UIView.animate(withDuration: 0.5, delay: 2) { [weak self] in
            self?.loadingView.alpha = 0
        } completion: { [weak self] _ in
            self?.resultsView.isHidden = empty
            if empty { UIView.animate(withDuration: 0.2) { self?.noResultsView.alpha = 1 } }
        }
    }
}
