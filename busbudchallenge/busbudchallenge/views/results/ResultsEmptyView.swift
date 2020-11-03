//
//  ResultsEmptyView.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 3/11/20.
//

import UIKit
import Lottie

protocol ResultsEmptyViewDelegate {
    func onTryAgainButtonPressed()
}

class ResultsEmptyView: UIView {
    
    private var notFoundAnimation: AnimationView = {
        let av = AnimationView(name: "not-found")
        av.loopMode = .loop
        return av
    }()
    
    private var notFoundLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "No Departures at This Time"
        lbl.font = UIFont.helveticaBold(ofSize: 26)
        lbl.textColor = .systemGray
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private var tryAgainButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 10
        btn.isUserInteractionEnabled = true
        btn.backgroundColor = .corporateYellow
        btn.setTitle("Try Again", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.isUserInteractionEnabled = true
        btn.addTarget(self, action: #selector(onTryAgainButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    var delegate: ResultsEmptyViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ResultsEmptyView {
    func setupView() {
        addSubview(notFoundAnimation)
        addSubview(notFoundLabel)
        addSubview(tryAgainButton)
        
        notFoundAnimation.play()
    }
    
    func setupConstraints() {
        notFoundAnimation.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(40)
        }
        notFoundLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).inset(50)
            make.leading.trailing.equalTo(notFoundAnimation)
        }
        tryAgainButton.snp.makeConstraints {
            $0.leading.bottom.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(60)
        }
    }
    
    @objc func onTryAgainButtonPressed() {
        guard let delegate = delegate else { return }
        delegate.onTryAgainButtonPressed()
    }
}
