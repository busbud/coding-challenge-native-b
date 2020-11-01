//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI
import OsheagaKit
import SDWebImageSwiftUI

extension CGFloat {

    var int: Int {
        Int(self)
    }
}

struct DepartureRowView {

    let item: DepartureItem

    enum Constants {
        static let logoSize: CGSize = CGSize(width: 150, height: 50)
    }
}

extension DepartureRowView: View {

    @ViewBuilder
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            locations
            seperator
            details
        }
        .padding()
        .background(Color.white_0_ink_750)
        .cornerRadius(20)
    }

    private var locations: some View {
        HStack(alignment: .top, spacing: 3) {
            locationInfo(item.departure, alignment: .leading)
            locationsLine(item.duration)
            locationInfo(item.arrival, alignment: .trailing)
        }
        .foregroundColor(.ink_750_0)
    }

    private func locationsLine(_ duration: TimeInterval) -> some View {
        VStack(alignment: .center, spacing: 8) {
            HStack(spacing: 3) {
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(Color.blush)

                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                    .frame(height: 1)
                    .foregroundColor(.gray_white)

                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(Color.goldy)
            }

            Text(duration.stringFromTimeInterval)
                .avenirNextRegular(12)
        }
        .padding(.horizontal, 4)
        .padding(.top, 8)
        .layoutPriority(1)
    }

    private func locationInfo(_ info: DepartureItem.LocationInfo, alignment: HorizontalAlignment) -> some View {
        VStack(alignment: alignment, spacing: 2) {
            Text("\(info.name)")
                .changaOneRegular(18)
            Text("\(info.city)")
                .avenirNextRegular(12)
                .padding(.bottom, 6)
            Text("\(info.time)")
                .changaOneRegular(20)
        }
        .layoutPriority(2)
    }

    private var seperator: some View {
        HStack(spacing: 0) {
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.blush)
                .padding(.leading, -40)
            Line()
               .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
               .frame(height: 1)
                .padding(.horizontal, 10)
                .foregroundColor(.gray_white)
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.blush)
                .padding(.trailing, -40)
        }
    }

    private var details: some View {
        HStack(spacing: 20) {
            operatorProvider
            Spacer()
            price
        }
    }

    @ViewBuilder
    private var operatorProvider: some View {
        if let operatorProvider = item.operatorProvider {
            if let logoURL = operatorProvider.logoURL {
                WebImage(url: logoURL.url(.init(w: Constants.logoSize.width.int, h: Constants.logoSize.height.int)))
                    .resizable()
                    .transition(.fade(duration: 0.5))
                    .scaledToFill()
                    .frame(width: Constants.logoSize.width, height: Constants.logoSize.height, alignment: .center)
                    .clipped()
            } else {
                Text(operatorProvider.displayName)
                    .avenirNextRegular(14)
                    .foregroundColor(.gray_white)
            }
        }
    }

    private var price: some View {
        Text(item.price)
            .changaOneRegular(24)
            .foregroundColor(.goldy)
            .padding(6)
            .background(Color.blush)
            .cornerRadius(6)
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct DepartureRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                DepartureRowView(item: .make())
                    .padding()
                    .background(Color.blush)
                    .environment(\.colorScheme, colorScheme)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
