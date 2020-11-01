//
//  OnboardingPage.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit

class OnboardingPage: UIView {
    
    var item: OnboardingItem?
    var isLastItem: Bool?
    
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
        btn.backgroundColor = .white
        btn.setTitle("Lets Go!", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.setTitleColor(.corporatePink, for: .normal)
        return btn
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        return lbl
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 3
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

private extension OnboardingPage {
    func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(onStartButton)
        backgroundColor = .corporatePink
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.equalTo(snp.width)
            make.height.equalTo(500)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.centerX.equalTo(snp.centerX)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.width.equalTo(safeAreaLayoutGuide).inset(30)
            make.height.equalTo(40)
            make.centerX.equalTo(snp.centerX)
        }
        onStartButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading
                .bottom
                .trailing
                .equalTo(safeAreaLayoutGuide).inset(30)
        }
    }
    
    func setupContent() {
        guard let item = item, let isLastItem = isLastItem else { return }
        onStartButton.isHidden = !isLastItem
        imageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        subtitleLabel.text = item.description
    }
}
