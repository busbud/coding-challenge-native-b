//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI
import OsheagaKit

struct DepartureResultView {

    private let service = DepartureSearchService()

    @State private var result: LoadingState<DepartureSearchResult, OsheagaError> = .pending

    func search() {
        service.fetch(into: $result)
    }
}

extension DepartureResultView: View {

    @ViewBuilder
    var body: some View {
        if let items = result.success?.items, items.count > 0 {
            Text(items.first!.departureAddress)
        } else if let failure = result.failure {
            Text(failure.localizedDescription)
        } else {
            Text("Loading")
                .padding()
                .onAppear(perform: search)
        }
    }
}

struct DepartureSearchView_Previews: PreviewProvider {

    static var previews: some View {
        DepartureResultView()
    }
}
