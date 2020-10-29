//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI

struct CustomFont: ViewModifier {

    let fontName: String
    let size: CGFloat

    @Environment(\.sizeCategory) var sizeCategory

    init<Font>(font: Font, size: CGFloat) where Font: RawRepresentable, Font.RawValue == String {
        self.fontName = font.rawValue
        self.size = size
    }

    init(changaOne: ChangaOne.Weight, size: CGFloat) {
        self.init(font: changaOne, size: size)
    }

    init(avenirNext: AvenirNext.Weight, size: CGFloat) {
        self.init(font: avenirNext, size: size)
    }

    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .font(.custom(fontName, fixedSize: size))
        }
        else {
            content
                .font(.custom(fontName, size: size))
        }
    }
}

struct ChangaOne {
    enum Weight: String {
        case regular = "ChangaOne"
    }
}

struct AvenirNext {
    enum Weight: String {
        case light = "AvenirNext-UltraLight"
        case medium = "AvenirNext-Medium"
        case regular = "AvenirNext-Regular"
        case bold = "AvenirNext-Bold"
        case semibold = "AvenirNext-DemiBold"
    }
}

extension View {

    func changaOneRegular(_ size: CGFloat) -> some View {
        modifier(CustomFont(changaOne: .regular, size: size))
    }

    func avenirNextRegular(_ size: CGFloat) -> some View {
        modifier(CustomFont(avenirNext: .regular, size: size))
    }

    func avenirNextMedium(_ size: CGFloat) -> some View {
        modifier(CustomFont(avenirNext: .medium, size: size))
    }

    func avenirNextSemiBold(_ size: CGFloat) -> some View {
        modifier(CustomFont(avenirNext: .semibold, size: size))
    }

    func avenirNextBold(_ size: CGFloat) -> some View {
        modifier(CustomFont(avenirNext: .bold, size: size))
    }
}

#if DEBUG
struct Font_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("Some Text")
                .changaOneRegular(14)
            Text("Some Text")
                .changaOneRegular(18)
            Text("Some Text")
                .avenirNextRegular(14)
            Text("Some Text")
                .avenirNextMedium(14)
            Text("Some Text")
                .avenirNextSemiBold(14)
            Text("Some Text")
                .avenirNextBold(14)
        }
        .padding()
        .previewLayout(.sizeThatFits)
        .background(Color(.systemBackground))
    }
}
#endif
