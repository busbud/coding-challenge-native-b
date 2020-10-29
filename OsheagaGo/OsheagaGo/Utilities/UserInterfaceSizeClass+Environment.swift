//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    var isHorizontallyCompact: Bool {
        horizontalSizeClass == .compact
    }

    var isVerticallyCompact: Bool {
        verticalSizeClass == .compact
    }

    var isLandscape: Bool {
        UIDevice.current.orientation.isLandscape
    }
}
