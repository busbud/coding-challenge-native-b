//
//  OnboardingViewController.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit

class OnboardingViewController: UIViewController {

    private let onboardingItems = OnboardingItem.collection
    private var frame = CGRect()
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.isPagingEnabled = true
        sv.showsHorizontalScrollIndicator = false
        sv.isUserInteractionEnabled = true
        sv.delegate = self
        sv.frame = view.frame
        sv.contentSize = CGSize(width: sv.frame.size.width * CGFloat(onboardingItems.count),
                                height: sv.frame.size.height)
        return sv
    }()
    
    private var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .systemGroupedBackground
        pc.currentPageIndicatorTintColor = .corporateYellow
        pc.isUserInteractionEnabled = false
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupContent()
    }
}

private extension OnboardingViewController {
    func setupViews() {
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.size.equalTo(view.snp.size)
        }
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    func setupContent() {
        pageControl.numberOfPages = onboardingItems.count
        for (i, item) in onboardingItems.enumerated() {
            frame.origin.x = scrollView.frame.size.width * CGFloat(i)
            frame.size = scrollView.frame.size
            scrollView.addSubview(OnboardingPage(frame: frame,
                                                 item: item,
                                                 isLastItem: onboardingItems.last == item))
        }
    }
}

extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.currentPage = index
    }
}
