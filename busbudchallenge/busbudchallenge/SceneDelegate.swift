//
//  SceneDelegate.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 31/10/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UIViewController()
        window?.backgroundColor = .black
        window?.makeKeyAndVisible()
    }

}

