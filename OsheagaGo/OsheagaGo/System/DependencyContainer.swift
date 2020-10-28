//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation
import OsheagaKit

final class DependencyContainer {

    static let shared = DependencyContainer()

    lazy var restClient = RestClient(baseURL: URL(string: "https://napi.busbud.com")!)
}
