//
//  PageControl.swift
//  BBChallenge
//
//  Created by Luis Alfonso Marquez Lecona on 2020-09-10.
//  Copyright © 2020 Busbud. All rights reserved.
//

import SwiftUI

/**
 `PageView` is a utility for generic Page Views`
 */
struct PageView<Page: View>: View {
    /// Page counter index (the source)
    @State private var currentPage = 0
    
    /// Wrapper Page inside UIHostingController array
    var viewControllers: [UIHostingController<Page>]
    
    /// Wrapper Page inside UIHostingController array
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        NavigationView {
            // Align bottom for the PageController
            ZStack(alignment: .bottom) {
                PageViewController(controllers: viewControllers, currentPage: $currentPage)
                // Trick to display a button in the last Page
                if currentPage == (viewControllers.count - 1) {
                    startButton
                }
                PageControl(pageCount: viewControllers.count, currentPage: $currentPage)
                    .padding(.trailing)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

private extension PageView {
    /// Button to exit the onboarding
    var startButton: some View {
        //Access the scene layour
        GeometryReader { proxy in
            // Transition to an emptyView until it exists the  next view
            NavigationLink(destination: EmptyView()) {
                Text("Start")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width:proxy.size.width - 64, height: 100)
            .background(LinearGradient(gradient:
                .init(colors: [Color.green,Color.blue]),
                                       startPoint: .bottomLeading,
                                       endPoint: .topTrailing)
            )
                .cornerRadius(50)
                .padding(.horizontal, 32)
                .padding(.top, proxy.size.height-132)
                .shadow(color: Color.gray.opacity(0.4),
                        radius: 6, x: 1, y: 2)
                .animation(.easeIn(duration: 1))
                .transition(.opacity)
        }
    }
}
