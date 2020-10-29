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
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                search()
                            }
                        }
                }
            }
            .padding(.top, 16)
            .comfortableReadingWidth()
        }
    }

    private var backgroundView: some View {
        Color.blush
            .edgesIgnoringSafeArea(.all)
    }

    private var loading: some View {
        VStack {
            Text("Searching...\nQuébec city to Montréal")
                .changaOneRegular(24)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            LottieView(animation: .loading, loopMode: .loop)
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
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
        VStack(alignment: .center, spacing: 100) {
            Text("No results!")
                .changaOneRegular(24)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
            Button(action: { self.search() }, label: {
                Text("Try again")
                    .avenirNextBold(24)
                    .foregroundColor(.ink_750_0)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 24)
                    .background(Color.white_0_ink_750)
                    .cornerRadius(20)
            })
        }
    }
}

struct DepartureResultView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                Group {
                    DepartureResultView(result: .success(.make(10)))
                    DepartureResultView(result: .success(.make(0)))
                    DepartureResultView(result: .pending)
                    DepartureResultView(result: .failure(.noData))
                }
                .environment(\.colorScheme, colorScheme)
            }
        }
    }
}
