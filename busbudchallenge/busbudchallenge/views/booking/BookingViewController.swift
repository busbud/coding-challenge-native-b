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
        iv.image = UIImage(named: "imFestivalLogo")
        iv.heroID = "imFestivalLogo"
        iv.heroModifiers = [.useNormalSnapshot]
        return iv
    }()
    
    private var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helvetica(ofSize: 18)
        lbl.textColor = .systemGray
        lbl.text = "It will be hot this summer in Montreal with the Osheaga festival! Assuming we're not stuck with another wave of COVID-19, it will also be a rocking festival!"
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()
    
    private var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.helveticaBold(ofSize: 22)
        lbl.textColor = .systemGray
        lbl.text = "Lets book a trip!!!"
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
    func onSearchButtonTapped(_ searchItems: [SearchSection]) {
        // push results view
        print("navigate to results page")
    }
}

private extension BookingViewController {
    func setupView() {
        hero.isEnabled = true
        
        navigationItem.title = "Search Departures"
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
