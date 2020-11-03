//
//  ResultsLoadingView.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import UIKit
import Lottie

class ResultsLoadingView: UIView {

    private var loadingView: AnimationView = {
        let av = AnimationView(name: K.Identifiers.loadingAnimation)
        av.loopMode = .loop
        return av
    }()
    
    private var labelView: UILabel = {
        let lbl = UILabel()
        lbl.text = K.Strings.searchingBuses
        lbl.font = UIFont.helveticaBold(ofSize: 26)
        lbl.textColor = .systemGray
        lbl.textAlignment = .center
        lbl.alpha = 0
        return lbl
    }()
    
    private var bottomAnimation: AnimationView = {
        let av = AnimationView(name: K.Identifiers.bouncingDot)
        av.loopMode = .loop
        return av
    }()
    
    private var fakeBottonView: UIView = {
        let v = UIView()
        v.hero.id = K.Identifiers.bouncingDot
        v.backgroundColor = .corporateYellow
        v.layer.cornerRadius = 30
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        delay(durationInSeconds: 0.5) { [weak self] in
            self?.bottomAnimation.play()
            self?.loadingView.play()
            self?.labelView.fadeIn(duration: 0.2)
            self?.fakeBottonView.isHidden = true
        }
    }
}

private extension ResultsLoadingView {
    func setupView() {
        addSubview(loadingView)
        addSubview(labelView)
        addSubview(bottomAnimation)
        addSubview(fakeBottonView)
    }
    
    func setupConstraints() {
        loadingView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(10)
            $0.centerX.equalTo(snp.centerX)
            $0.width.height.equalTo(snp.width)
        }
        labelView.snp.makeConstraints {
            $0.top.equalTo(loadingView.snp.bottom).offset(10)
            $0.width.equalTo(snp.width)
        }
        fakeBottonView.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(20)
            $0.centerX.equalTo(snp.centerX)
        }
        bottomAnimation.snp.makeConstraints {
            $0.width.equalTo(snp.width)
            $0.height.equalTo(snp.height).dividedBy(3)
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalTo(snp.centerX)
        }
    }
}
