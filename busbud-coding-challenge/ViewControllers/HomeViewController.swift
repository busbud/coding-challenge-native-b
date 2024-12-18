//
//  HomeViewController.swift
//  busbud-coding-challenge
//
//  Created by Spencer Diniz on 17/12/24.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    private var stackViewMain: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually

        return stackView
    }()

    private var stackViewButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually

        return stackView
    }()

    private var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String(localized: "Choose the experience:")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)

        return label
    }()

    private var buttonUIKit: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(String(localized: "UIKit"), for: .normal)
        button.setTitleColor(.darkText, for: .normal)
        button.backgroundColor = .systemOrange
        button.clipsToBounds = true
        button.layer.cornerRadius = 4.0
        button.layer.masksToBounds = true

        return button
    }()

    private var buttonSwiftUI: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(String(localized: "SwiftUI"), for: .normal)
        button.setTitleColor(.darkText, for: .normal)
        button.backgroundColor = .systemOrange
        button.clipsToBounds = true
        button.layer.cornerRadius = 4.0
        button.layer.masksToBounds = true

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"

        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(stackViewMain)

        stackViewMain.addArrangedSubview(labelTitle)
        stackViewMain.addArrangedSubview(stackViewButtons)
        stackViewButtons.addArrangedSubview(buttonUIKit)
        stackViewButtons.addArrangedSubview(buttonSwiftUI)

        NSLayoutConstraint.activate([
            stackViewMain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewMain.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonUIKit.heightAnchor.constraint(equalToConstant: 44),
            buttonUIKit.widthAnchor.constraint(equalToConstant: 120),
            buttonSwiftUI.heightAnchor.constraint(equalToConstant: 44),
            buttonSwiftUI.widthAnchor.constraint(equalToConstant: 120),
        ])

        buttonUIKit.addTarget(self, action: #selector(startUIKitDemo), for: .touchUpInside)
        buttonSwiftUI.addTarget(self, action: #selector(startSwiftUIDemo), for: .touchUpInside)
    }

    @objc private func startUIKitDemo() {
        let suggestionsViewModel = SuggestionsListViewModel()
        let suggestionsViewController = SuggestionsListViewController(viewModel: suggestionsViewModel)
        let navigationViewController = UINavigationController(rootViewController: suggestionsViewController)
        navigationViewController.modalPresentationStyle = .fullScreen

        present(navigationViewController, animated: true)
    }

    @objc private func startSwiftUIDemo() {
        let suggestionsViewModel = SuggestionsListViewModel()
        let suggestionsView = SuggestionsListView(viewModel: suggestionsViewModel)

        let hostingController = UIHostingController(rootView: suggestionsView)
        hostingController.modalPresentationStyle = .fullScreen

        present(hostingController, animated: true)
    }
}
