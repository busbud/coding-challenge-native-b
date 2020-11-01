//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI
import OsheagaKit

struct DepartureResultView {

    // 2020-11-25
    private let searchDate = DateComponents(calendar: .current,
                                                   timeZone: Calendar.current.timeZone,
                                                   year: 2020, month: 11, day: 25).date ?? Date()

    private let service = DepartureSearchService()

    @State var result: DepartureSearchResult = .init()
    @State var loading: LoadingState<DepartureSearchResponse, OsheagaError> = .pending
    @State private var firstAppear = true
    @State private var index: Int? = nil

    private func start() {
        if firstAppear {
            firstAppear = false
            search()
        }
    }

    private func search(_ delay: TimeInterval = 2) {
        if !loading.isPending {
            loading = .pending
        }
        service.fetch(param: .make(date: searchDate, poll: index != nil),
                      query: .make(with: index),
                      into: $result,
                      with: $loading,
                      delay: delay)
    }
}

extension DepartureResultView: View {

    var body: some View {
        ZStack {
            backgroundView
            content
                .padding(.top, 16)
                .comfortableReadingWidth()
        }
        .edgesIgnoringSafeArea(.all)
    }

    private var backgroundView: some View {
        Color.blush
            .edgesIgnoringSafeArea(.all)
    }

    @ViewBuilder
    private var content: some View {
        if loading.isSuccess {
            if result.items.count > 0 {
                results(result)
            } else {
                noResults
            }
        } else if let failure = loading.failure {
            failureView(error: failure)
        } else {
            loadingView
                .onAppear(perform: start)
        }
    }

    private var loadingView: some View {
        VStack {
            Text("departure_result_loading")
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
            Text("no_results")
                .changaOneRegular(24)
                .foregroundColor(.white)
                .padding(.horizontal, 16)

            Button(action: { self.search(1) }, label: {
                Text("button_try_again")
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
                    DepartureResultView(result: .make(3), loading: .success(.make()))
                    DepartureResultView(result: .make(0), loading: .success(.make()))
                    DepartureResultView(loading: .pending)
                    DepartureResultView(loading: .failure(.noData))
                }
                .environment(\.colorScheme, colorScheme)
            }
        }
    }
}
