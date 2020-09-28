//
//  OnbardingView.swift
//  busbud
//
//  Created by Nitin kachhadiya on 28/09/20.
//  Copyright © 2020 Nitin kachhadiya. All rights reserved.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    
    var subviews = [
        UIHostingController(rootView: Subview(imageString: "onbarding1")),
        UIHostingController(rootView: Subview(imageString: "onbarding2")),
        UIHostingController(rootView: Subview(imageString: "onbarding3"))
    ]
    
    var titles = ["Book your bus tickets online", "Find cheap bus tickets", "Your trip, your priorities"]
    
    var captions =  ["With Busbud, you can easily compare buses and find cheap bus tickets for your next bus trip.", "You can find the best bus tickets prices by booking in advance; the earlier you book your bus trip generally the cheaper your tickets will be!", "On a budget? Tight schedule? Book tickets that fit your needs."]
    
    @State var currentPageIndex = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
                .frame(height: 600)
            Group {
                Text(titles[currentPageIndex])
                    .font(.title)
                Text(captions[currentPageIndex])
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(width: 300, height: 50, alignment: .leading)
                .lineLimit(nil)
            }
                .padding()
            HStack {
                PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                Spacer()
                Button(action: {
                    if self.currentPageIndex+1 == self.subviews.count {
                        
                        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene

                        if let windowScenedelegate = scene?.delegate as? SceneDelegate {
                           let window = UIWindow(windowScene: scene!)
                           window.rootViewController = HomeModule().build()
                           windowScenedelegate.window = window
                           window.makeKeyAndVisible()
                        }
                        
                        //self.currentPageIndex = 0
                    } else {
                        self.currentPageIndex += 1
                    }
                }) {
                    ButtonContent()
                }
            }
                .padding()
        }
    }
}

struct ButtonContent: View {
    var body: some View {
        Image(systemName: "arrow.right")
        .resizable()
        .foregroundColor(.white)
        .frame(width: 30, height: 30)
        .padding()
        .background(Color.orange)
        .cornerRadius(30)
    }
}

#if DEBUG
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
#endif
