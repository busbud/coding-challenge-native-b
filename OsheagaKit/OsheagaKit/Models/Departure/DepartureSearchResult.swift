//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public struct DepartureSearchResult {

    public let result: DepartureSearchResponse

    public init(_ result: DepartureSearchResponse) {
        print(result)
        self.result = result
    }
}
