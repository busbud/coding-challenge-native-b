//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI
import OsheagaKit

struct DepartureResultView {

    private let service = DepartureSearchService()

    @State var result: LoadingState<DepartureSearchResult, OsheagaError> = .pending

    func search() {
        service.fetch(into: $result)
    }
}

extension DepartureResultView: View {

    @ViewBuilder
    var body: some View {
        ZStack {
            backgroundView
            Group {
                if let items = result.success?.items {
                    if items.count > 0 {
                        results(items: items)
                    } else {
                        noResults
                    }
                } else if let failure = result.failure {
                    failureView(error: failure)
                } else {
                    loading
                }
            }
            .comfortableReadingWidth()
        }
    }

    private var backgroundView: some View {
        Color.blush
            .edgesIgnoringSafeArea(.all)
    }

    private var loading: some View {
        VStack(alignment: .center) {
            Text("Loading")
                .onAppear(perform: search)
                .changaOneRegular(24)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
        }
    }

    private func results(items: [DepartureItem]) -> some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(items) {
                    DepartureRowView(item: $0)
                        .padding(.horizontal, 16)
                }
            }
        }
    }

    private func failureView(error: OsheagaError) -> some View {
        VStack(alignment: .center) {
            Text(error.localizedDescription)
                .changaOneRegular(24)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
        }
    }

    private var noResults: some View {
        VStack(alignment: .center) {
            Text("No results!")
                .changaOneRegular(24)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
        }
    }
}

struct DepartureResultView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            DepartureResultView(result: .success(.make(10)))
            DepartureResultView(result: .success(.make(0)))
            DepartureResultView(result: .pending)
            DepartureResultView(result: .failure(.noData))
        }
    }
}
