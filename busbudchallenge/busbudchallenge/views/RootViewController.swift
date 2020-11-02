//
//  ViewController.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit
import Hero

class RootViewController: UIViewController {
    
    private var isFirstRun = LocalStorage.shared.getValue(for: .firstRun) ?? true
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: K.Identifiers.imFestivalLogo)
        iv.heroID = K.Identifiers.imFestivalLogo
        return iv
    }()
    
    private var loadinView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.startAnimating()
        ai.color = .corporateYellow
        return ai
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delay(durationInSeconds: 1) { [weak self] in
            self?.showInitialView()
        }
    }
    
}

private extension RootViewController {
    func showInitialView() {
        if isFirstRun {
            let controller = OnboardingViewController()
            controller.modalPresentationStyle = .overFullScreen
            present(controller, animated: true)
        } else {
            let controller = UINavigationController()
            controller.viewControllers = [BookingViewController()]
            controller.hero.isEnabled = true
            controller.modalPresentationStyle = .overFullScreen
            present(controller, animated: true)
        }
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(loadinView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.width.equalTo(215)
            $0.height.lessThanOrEqualTo(65)
            $0.center.equalTo(view.snp.center)
        }
        loadinView.snp.makeConstraints {
            $0.width.equalTo(20)
            $0.height.equalTo(20)
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }
}
