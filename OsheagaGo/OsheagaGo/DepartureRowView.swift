//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI
import OsheagaKit
import SDWebImageSwiftUI

struct DepartureRowView {

    let item: DepartureItem
}

extension DepartureRowView: View {

    @ViewBuilder
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(item.departure.name)")
                    Text("\(item.departure.city)")
                    Text("\(item.departure.time)")
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 12) {
                    Text("\(item.arrival.name)")
                    Text("\(item.arrival.city)")
                    Text("\(item.arrival.time)")
                }
            }

            HStack(spacing: 20) {
                if let operatorProvider = item.operatorProvider {
                    if let logoURL = operatorProvider.logoURL {
                        WebImage(url: logoURL.url(width: 100, height: 30)!)
                            .resizable()
                            .transition(.fade(duration: 0.5))
                            .scaledToFill()
                            .frame(width: 100, height: 30, alignment: .center)
                            .clipped()
                    } else {
                        Text(operatorProvider.displayName)
                    }
                }
                Spacer()
                Text(item.price)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(30)
    }
}

struct DepartureRowView_Previews: PreviewProvider {
    static var previews: some View {
        DepartureRowView(item: .make())
            .padding()
            .background(Color.red)
            .previewLayout(.sizeThatFits)

    }
}
