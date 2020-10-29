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
        if let items = result.success?.items {
            if items.count > 0 {
                results(items: items)
            } else {
                noResults
            }
        } else if let failure = result.failure {
            Text(failure.localizedDescription)
        } else {
            Text("Loading")
                .padding()
                .onAppear(perform: search)
        }
    }

    private func results(items: [DepartureItem]) -> some View {
        List(items) {
            DepartureRowView(item: $0)
        }
    }

    private var noResults: some View {
        Text("No results!")
    }
}

struct DepartureResultView_Previews: PreviewProvider {

    static var previews: some View {
        DepartureResultView(result: .success(.make()))
    }
}
