//
//  OnboardingViewController.swift
//  Osheage
//
//  Created by georgy.emelyanov on 27.09.2020.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var searchButton: UIButton!
    
    required init() {
        super.init(nibName: "OnboardingViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @IBAction private func searchButtonTapped() {
        let vm = DeparturesViewModel(originCity: DemoData.originCity,
                                     destinationCity: DemoData.destinationCity,
                                     outboundDate: DemoData.outboundDateString)
        let vc = DeparturesViewController(viewModel: vm)
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true, completion: nil)
    }
}


private extension OnboardingViewController {
    func configureUI() {
        configureTitleLabel()
        configureSearchButton()
    }
    
    func configureTitleLabel() {
        titleLabel.layer.shadowColor = UIColor.black.cgColor
        titleLabel.layer.shadowRadius = 3.0
        titleLabel.layer.shadowOpacity = 1.0
        titleLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        titleLabel.layer.masksToBounds = false
    }
    
    func configureSearchButton() {
        searchButton.layer.cornerRadius = 22
        searchButton.layer.shadowColor = UIColor.black.cgColor
        searchButton.layer.shadowRadius = 2.0
        searchButton.layer.shadowOpacity = 0.0
        searchButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        searchButton.layer.masksToBounds = false
    }
}
