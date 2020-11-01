//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI

protocol ColorPrimitive {
    static func make(withAssetCatalogName: String) -> Self
}

extension ColorPrimitive {

    // MARK: White

    static var white_universal: Self {
        make(withAssetCatalogName: "white_universal")
    }

    static var white_0_ink_750: Self {
        make(withAssetCatalogName: "white 0 > ink 750")
    }
    
    static var white_100_ink_550: Self {
        make(withAssetCatalogName: "white 100 > ink 550")
    }

    static var gray_white: Self {
        make(withAssetCatalogName: "gray > white")
    }

    // MARK: Blush

    static var blush: Self {
        make(withAssetCatalogName: "blush")
    }

    // MARK: Ink

    static var ink_750_0: Self {
        make(withAssetCatalogName: "ink 750 > 0")
    }

    static var ink_750: Self {
        make(withAssetCatalogName: "ink 750")
    }

    // MARK: Goldy

    static var goldy: Self {
        make(withAssetCatalogName: "goldy")
    }
}

extension Color: ColorPrimitive {

    static func make(withAssetCatalogName name: String) -> Self { Color(name) }
}

extension UIColor: ColorPrimitive {

    static func make(withAssetCatalogName name: String) -> Self {
        guard let color = Self(named: name) else {
            fatalError("Unknown color name: \(name)")
        }
        return color
    }
}

struct Colors_Previews: PreviewProvider {

    static var colors: [Color] = [
        .white_universal, .white_0_ink_750, .gray_white, .blush, .ink_750_0, .goldy
    ]

    static var previews: some View {
        ForEach(colors, id: \.self) { color in
            Group {
                HStack(spacing: 10) {
                    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                        Rectangle()
                            .fill(color)
                            .frame(width: 60, height: 60)
                            .padding(.vertical, 10)
                            .environment(\.colorScheme, colorScheme)
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .background(Color(.gray))
        .previewLayout(.sizeThatFits)
    }
}
