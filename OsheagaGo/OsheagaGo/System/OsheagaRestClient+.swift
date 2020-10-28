//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI
import OsheagaKit

extension RestClient: EnvironmentKey {

    public static let defaultValue: OsheagaRestClient = DependencyContainer.shared.restClient
}

extension EnvironmentValues {

    public var restClient: OsheagaRestClient {
        self[RestClient.self]
    }
}
