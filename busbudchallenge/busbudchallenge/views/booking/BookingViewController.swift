//
//  BookingViewController.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit
import SnapKit

class BookingViewController: UIViewController {
    private lazy var bookingView: BookingView = {
        let bv = BookingView()
        bv.delegate = self
        return bv
    }()
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: K.Identifiers.imFestivalLogo)
        iv.heroID = K.Identifiers.imFestivalLogo
        iv.heroModifiers = [.useNormalSnapshot]
        return iv
    }()
    
    private var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helvetica(ofSize: 18)
        lbl.textColor = .systemGray
        lbl.text = K.Strings.searchTitle
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()
    
    private var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helveticaBold(ofSize: 22)
        lbl.textColor = .systemGray
        lbl.text = K.Strings.searchSubtitle
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupContent()
    }
}

extension BookingViewController: BookingViewDelegate {
    func onSearchButtonTapped(_ sections: Sections) {
        navigationController?.hero.isEnabled = true
        
        let searchRequest = APIRequest()
        searchRequest.endpoint = Endpoint.search(from: sections.departureInfo.first!.geohash!,
                                                 to: sections.departureInfo.last!.geohash!,
                                                 date: sections.departureDates.first!.isoFormatted ,
                                                 poll: false)

        searchRequest.parameters = sections.passengersInfo.reduce([String:Int]()) { (dict, value) -> [String: Int] in
            var params = dict
            params[value.type.rawValue] = value.count
            return params
        }
        searchRequest.parameters?["lang"] = Locale.current.languageCode
        searchRequest.parameters?["currency"] = Locale.current.currencyCode ?? "USD"
        
        let resultViewModel = ResultsViewModel(apiManager: APIManager(), resultRequest: searchRequest)
        navigationController?.pushViewController(ResultsViewController(with: resultViewModel), animated: true)
        
    }
}

private extension BookingViewController {
    func setupView() {
        hero.isEnabled = true
        
        navigationItem.title = K.Strings.search
        navigationController?.navigationBar.backgroundColor = .corporateYellow
        
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(imageView)
        view.addSubview(bookingView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(120)
            $0.width.equalTo(view.snp.width).inset(50)
            $0.height.lessThanOrEqualTo(imageView.snp.width).dividedBy(3)
            $0.centerX.equalTo(view.snp.centerX)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        bookingView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom)
            $0.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
    
    func setupContent() {
        
    }
}
