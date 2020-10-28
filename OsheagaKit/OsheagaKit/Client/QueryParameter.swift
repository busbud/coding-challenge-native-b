//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public protocol QueryParameter {
    func configurePath(url: URL) -> URL
}
