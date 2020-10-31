//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI
import OsheagaKit

struct DepartureResultView {

    private let service = DepartureSearchService()

    @State var result: LoadingState<DepartureSearchResult, OsheagaError> = .pending
    @State private var firstAppear = true
    @State private var index: Int? = nil

    private func start() {
        if firstAppear {
            firstAppear = false
            search()
        }
    }

    private func search(_ delay: TimeInterval = 2) {
        if !result.isPending {
            result = .pending
        }
        if let index = index {
            service.fetch(param: .makePoll(), query: .makePoll(index), into: $result, delay: delay)
        } else {
            service.fetch(into: $result, delay: delay)
        }
    }
}

extension DepartureResultView: View {

    @ViewBuilder
    var body: some View {
        ZStack {
            backgroundView
            Group {
                if let result = result.success {
                    if result.items.count > 0 {
                        results(result)
                    } else {
                        noResults
                    }
                } else if let failure = result.failure {
                    failureView(error: failure)
                } else {
                    loading
                        .onAppear(perform: start)
                }
            }
            .padding(.top, 16)
            .comfortableReadingWidth()
        }
        .edgesIgnoringSafeArea(.all)
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

    @ViewBuilder
    private func results(_ result: DepartureSearchResult) -> some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                Section(header: header, footer: footer) {
                    ForEach(result.items) { item in
                        DepartureRowView(item: item)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                    }
                    if !result.complete {
                        Button(action: {
                            self.index = (self.index ?? 0) + 1
                            self.search()
                        }, label: {
                            Text("More")
                                .padding(.top, 16)
                                .changaOneRegular(24)
                                .foregroundColor(.goldy)
                        })
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }

    private var header: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(maxWidth: .infinity, idealHeight: 44)
    }

    private var footer: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(maxWidth: .infinity, idealHeight: 44)
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

            Button(action: { self.search(1) }, label: {
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
                    DepartureResultView(result: .success(.make(3)))
                    DepartureResultView(result: .success(.make(0)))
                    DepartureResultView(result: .pending)
                    DepartureResultView(result: .failure(.noData))
                }
                .environment(\.colorScheme, colorScheme)
            }
        }
    }
}
