//
//  SceneDelegate.swift
//  PersonsResume
//
//  Created by . on 2023-09-01.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ResumeViewControllerAssembly().create()
        self.window = window
        window.makeKeyAndVisible()
    }

}

