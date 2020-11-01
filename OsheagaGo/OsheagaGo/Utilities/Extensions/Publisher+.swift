//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI
import Combine

enum LoadingState<Success, Failure: Error> {

    case pending, active, success(Success), failure(Failure)
}

extension LoadingState {

    public var isPending: Bool {
        if case .pending = self {
            return true
        } else {
            return false
        }
    }

    public var isSuccess: Bool {
        if case .success = self {
            return true
        } else {
            return false
        }
    }
    
    var success: Success? {
        switch self {
        case let .success(success):
            return success
        default:
            return nil
        }
    }

    var failure: Failure? {
        switch self {
        case let .failure(failure):
            return failure
        default:
            return nil
        }
    }
}

extension Publisher {

    func updateLoadingState(_ loading: Binding<LoadingState<Output, Failure>>) -> AnyPublisher<Output, Never> {
        receive(on: DispatchQueue.main)
            .handleEvents(
                receiveOutput: { output in
                    loading.wrappedValue = .success(output)
                },
                receiveCompletion: { completion in
                    switch completion {
                    case let .failure(error):
                        loading.wrappedValue = .failure(error)
                    default:
                        break
                    }
                },
                receiveCancel: { },
                receiveRequest: { _ in
                    loading.wrappedValue = .active
                }
            )
            .ignoreFailures()
    }
}

extension Publisher {

    func ignoreFailures() -> AnyPublisher<Output, Never> {
        Publishers.Catch(upstream: self) { _ in
            Empty<Self.Output, Never>()
        }
        .eraseToAnyPublisher()
    }
}
