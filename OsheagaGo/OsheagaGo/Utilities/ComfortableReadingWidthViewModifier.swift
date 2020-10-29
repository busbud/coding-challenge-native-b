//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI

struct ComfortableReadingWidth: ViewModifier {

    static let comfortableReadingWidth: CGFloat = 672

    let minimum: CGFloat

    var width: CGFloat {
        min(minimum, ComfortableReadingWidth.comfortableReadingWidth)
    }

    func body(content: Content) -> some View {
        content
            .frame(idealWidth: width, maxWidth: width)
    }
}

extension View {

    func comfortableReadingWidth(minimum: CGFloat = .infinity) -> some View {
        modifier(ComfortableReadingWidth(minimum: minimum))
    }
}
