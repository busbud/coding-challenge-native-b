//
//  SuggestionsListView.swift
//  busbud-coding-challenge
//
//  Created by Spencer Diniz on 17/12/24.
//

import SwiftUI
import CoreLocation

struct SuggestionsListView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var viewModel: SuggestionsListViewModel
    @State private var isLoading = false
    @State private var locationError: String?

    init(viewModel: SuggestionsListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            Group {
                if isLoading {
                    ProgressView("Loading suggestions...")
                } else if let error = locationError {
                    Text("Error: \(error)").foregroundColor(.red)
                } else {
                    List(viewModel.suggestions, id: \.id) { suggestion in
                        NavigationLink(destination: SuggestionDetailView(viewModel: SuggestionDetailViewModel(suggestion: suggestion))) {
                            SuggestionRowView(suggestion: suggestion)
                        }
                    }
                }
            }
            .navigationTitle("Suggestions (SwiftUI)")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                fetchLocationAndLoadData()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Dismiss")
                    }
                }
            }
        }
    }

    private func fetchLocationAndLoadData() {
        Task {
            isLoading = true
            do {
                let locationService = LocationService()
                let coordinate = try await locationService.requestLocation()
                await viewModel.loadData(for: coordinate)
            } catch {
                locationError = error.localizedDescription
            }
            isLoading = false
        }
    }
}

// Row View
struct SuggestionRowView: View {
    let suggestion: Suggestion

    var body: some View {
        VStack(alignment: .leading) {
            Text(suggestion.cityName)
                .font(.headline)
            Text(suggestion.formattedDistance)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
