//
//  OnboardingViewController.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit
import Hero

class OnboardingViewController: UIViewController {

    private let onboardingItems = OnboardingItem.collection
    private var frame = CGRect()
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: K.Identifiers.imFestivalLogo)
        iv.heroID = K.Identifiers.imFestivalLogo
        iv.heroModifiers = .some([.useNormalSnapshot])
        return iv
    }()
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.isPagingEnabled = true
        sv.showsHorizontalScrollIndicator = false
        sv.isUserInteractionEnabled = true
        sv.delegate = self
        sv.frame = view.frame
        sv.contentSize = CGSize(width: sv.frame.size.width * CGFloat(onboardingItems.count),
                                height: sv.frame.size.height)
        sv.bounces = false
        return sv
    }()
    
    private var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .systemGroupedBackground
        pc.currentPageIndicatorTintColor = .corporatePink
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
        hero.isEnabled = true
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.addSubview(imageView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.size.equalTo(view.snp.size)
        }
        pageControl.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.centerX.equalTo(view.snp.centerX)
        }
        imageView.snp.makeConstraints {
            $0.width.equalTo(view.snp.width).inset(20)
            $0.height.lessThanOrEqualTo(imageView.snp.width).dividedBy(3)
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(view.snp.top).offset(200)
        }
    }
    
    func setupContent() {
        pageControl.numberOfPages = onboardingItems.count
        for (i, item) in onboardingItems.enumerated() {
            frame.origin.x = scrollView.frame.size.width * CGFloat(i)
            frame.size = scrollView.frame.size
            let page = OnboardingViewPage(frame: frame,
                                          item: item,
                                          isLastItem: onboardingItems.last == item)
            page.delegate = self
            scrollView.addSubview(page)
        }
    }
}

extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.currentPage = index
    }
}

extension OnboardingViewController: OnboardingViewPageDelegate {
    func onStartButtonTapped() {
        //LocalStorage.shared.save(false, for: .firstRun)
        let controller = UINavigationController()
        controller.hero.isEnabled = true
        controller.viewControllers = [BookingViewController()]
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
}
