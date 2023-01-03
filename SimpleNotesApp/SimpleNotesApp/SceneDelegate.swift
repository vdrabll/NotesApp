//
//  SceneDelegate.swift
//  SimpleNotesApp
//
//  Created by Виктория Федосова on 28.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) { guard let windowScene = (scene as? UIWindowScene) else { return }
        let view = NotesMainView()
        let navigationController = UINavigationController(rootViewController: view )
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }

}

