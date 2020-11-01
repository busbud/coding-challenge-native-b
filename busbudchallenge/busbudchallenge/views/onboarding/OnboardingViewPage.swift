//
//  OnboardingPage.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit
import Hero

protocol OnboardingViewPageDelegate {
    func onStartButtonTapped()
}

class OnboardingViewPage: UIView {
    
    private var item: OnboardingItem?
    private var isLastItem: Bool?
    var delegate: OnboardingViewPageDelegate?
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .center
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var onStartButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 10
        btn.isUserInteractionEnabled = true
        btn.backgroundColor = .corporatePink
        btn.setTitle(K.Strings.letsGo, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.isUserInteractionEnabled = true
        btn.addTarget(self, action: #selector(onStartButtonDidTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont.helveticaBold(ofSize: 38)
        return lbl
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont.helvetica(ofSize: 26)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    init(frame: CGRect, item: OnboardingItem, isLastItem: Bool) {
        super.init(frame: frame)
        self.item = item
        self.isLastItem = isLastItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupView()
        setupConstraints()
        setupContent()
    }
}

private extension OnboardingViewPage {
    func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(onStartButton)
        backgroundColor = .corporatePink
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.width.equalTo(snp.width)
            $0.height.equalTo(snp.height)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(snp.centerY).offset(50)
            $0.width.equalTo(safeAreaLayoutGuide).inset(30)
            $0.centerX.equalTo(snp.centerX)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.width.equalTo(safeAreaLayoutGuide).inset(30)
            $0.centerX.equalTo(snp.centerX)
        }
        onStartButton.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.leading.bottom.trailing
                .equalTo(safeAreaLayoutGuide).inset(30)
        }
    }
    
    func setupContent() {
        guard let item = item, let isLastItem = isLastItem else { return }
        onStartButton.isHidden = !isLastItem
        imageView.image = UIImage(named: item.imageName)?.blur(10.0)
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
    
    @objc func onStartButtonDidTapped() {
        onStartButton.spring()
        guard let delegate = delegate else {
            print("OnboardingPageDelegate not set yet")
            return
        }
        delegate.onStartButtonTapped()
    }
    
}
