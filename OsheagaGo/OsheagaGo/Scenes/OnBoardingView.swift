//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI

struct OnBoardingView: View {

    @Environment(\.isHorizontallyCompact) var isHorizontallyCompact
    @Environment(\.isLandscape) var isLandscape

    @State var letsGo: Bool = false
}

extension OnBoardingView {

    @ViewBuilder
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            backgroundView
            VStack {
                logo
                Group {
                    welcome
                    button
                }
                .transition(.fade(duration: 1))
            }
            if letsGo {
                DepartureResultView()
                    .transition(AnyTransition.move(edge: .bottom).animation(.easeInOut(duration: 2)))
            }
        }
    }

    private var backgroundView: some View {
        GeometryReader { geo in
            Image(!isHorizontallyCompact || isLandscape ? "Background-landscape" : "Background-portrait")
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
        }
        .edgesIgnoringSafeArea(.all)
    }

    private var logo: some View {
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 200)
    }

    private var welcome: some View {
        Group {
            VStack {
                Text("welcome_title")
                    .changaOneRegular(24)
                    .foregroundColor(.ink_750)
                Text("welcome_date")
                    .changaOneRegular(30)
            }
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.blush)
        .padding(.horizontal, 16)
    }

    private var button: some View {
        Button(action: { withAnimation { self.letsGo.toggle() }}) {
            VStack {
                Image("Busbud")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                Text("welcome_lets_go")
                    .changaOneRegular(24)
                    .foregroundColor(.white)
            }
        }
        .padding(.top, 100)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                OnBoardingView()
                    .environment(\.colorScheme, colorScheme)
            }
        }
    }
}
