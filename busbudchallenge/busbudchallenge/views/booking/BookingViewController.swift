//
//  BookingViewController.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit
import SnapKit

class BookingViewController: UIViewController {
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "imFestivalLogo")
        iv.heroID = "imFestivalLogo"
        iv.heroModifiers = [.useNormalSnapshot]
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupContent()
    }
}

private extension BookingViewController {
    func setupView() {
        hero.isEnabled = true
        
        navigationItem.title = "Search Departures"
        navigationController?.navigationBar.backgroundColor = .corporateYellow
        
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(imageView)
        
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.width.equalTo(view.snp.width).inset(50)
            $0.height.lessThanOrEqualTo(imageView.snp.width).dividedBy(3)
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(view.snp.top).offset(100)
        }
    }
    
    func setupContent() {
        
    }
}
