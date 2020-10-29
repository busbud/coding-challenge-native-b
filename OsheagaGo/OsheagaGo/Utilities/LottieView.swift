//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieView {

    enum FileName: String, CaseIterable {
        case button = "button-yes"
        case loading = "loading"
    }

    private let loopMode: LottieLoopMode
    private let completionBlock: (() -> Void)?
    private let animation: Lottie.Animation

    init(animation fileName: FileName = .loading, loopMode: LottieLoopMode = .playOnce, completed: (() -> Void)? = nil) {
        self.completionBlock = completed
        self.loopMode = loopMode
        guard let animation = Animation.named(fileName.rawValue, bundle: Bundle(for: BundleLocator.self)) else {
            fatalError("Lottie file named: \(fileName.rawValue) not found in the bundle.")
        }
        self.animation = animation
    }
}

extension LottieView: View {

    var body: some View {
        AnimationViewWrapper(animation: animation, loopMode: loopMode, completionBlock: completionBlock)
            .aspectRatio(animation.size, contentMode: .fit)
    }
}

private struct AnimationViewWrapper: UIViewRepresentable {

    private let loopMode: LottieLoopMode
    private let completionBlock: (() -> Void)?
    private let animation: Lottie.Animation

    init(animation: Lottie.Animation, loopMode: LottieLoopMode = .playOnce, completionBlock: (() -> Void)? = nil) {
        self.animation = animation
        self.completionBlock = completionBlock
        self.loopMode = loopMode
    }

    func makeUIView(context: Context) -> UIView {
        let container = UIView()

        let animationView = AnimationView()
        animationView.loopMode = loopMode
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.backgroundColor = .clear

        animationView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: container.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: container.heightAnchor)
        ])

        animationView.play { _ in
            self.completionBlock?()
        }
        container.backgroundColor = .clear
        return container
    }

    func updateUIView(_ uiView: UIView, context: Context) { /* no op */ }
}

// MARK: - Private

private class BundleLocator { }
