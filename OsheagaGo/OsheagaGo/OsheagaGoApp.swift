//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI

@main
struct OsheagaGoApp: App {
    var body: some Scene {
        WindowGroup {
            OnBoardingView()
                .onAppear(perform: {
                    UIScrollView.appearance().clipsToBounds = false
                })
        }
    }
}
