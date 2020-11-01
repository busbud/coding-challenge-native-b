//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation

public protocol PathParameter {
    func configurePath(url: URL) -> URL
}
