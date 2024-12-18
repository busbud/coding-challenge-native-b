//
//  SuggestionsViewController.swift
//  busbud-coding-challenge
//
//  Created by Spencer Diniz on 17/12/24.
//

import UIKit
import CoreLocation

class SuggestionsListViewController: UITableViewController {
    private let viewModel: SuggestionsListViewModel

    init(viewModel: SuggestionsListViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Suggestions (UIKit)"
        navigationItem.backButtonTitle = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissViewController))

        setupUI()

        Task {
            do {
                let locationService = LocationService()
                let coordinate = try await locationService.requestLocation()
                await viewModel.loadData(for: coordinate)

                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            } catch {
                print("Failed to get location: \(error.localizedDescription)")
            }
        }
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        tableView.separatorInset = .zero
    }

    @objc private func dismissViewController() {
        dismiss(animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.suggestions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let suggestion = viewModel.suggestions[indexPath.row]

        cell.textLabel?.text = suggestion.cityName
        cell.detailTextLabel?.text = suggestion.formattedDistance
        cell.accessoryType = .disclosureIndicator
        cell.separatorInset = .zero
        cell.selectionStyle = .none

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let suggestion = viewModel.suggestions[indexPath.row]
        let suggestionDetailViewModel = SuggestionDetailViewModel(suggestion: suggestion)
        let suggestionDetailViewController = SuggestionDetailViewController(viewModel: suggestionDetailViewModel)

        navigationController?.pushViewController(suggestionDetailViewController, animated: true)
    }
}
