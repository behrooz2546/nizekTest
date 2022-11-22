//
//  SceneDelegate.swift
//  NizekTest
//
//  Created by behrooz azimifar on 20/11/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    var enterBackgroundTime: Date?
    var enterForgroundTime: Date?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navController = UINavigationController()
        
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()
        
        window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        debugPrint("sceneDidDisconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        debugPrint("sceneDidBecomeActive")
        if let homeVC = topMostController() as? HomeViewController {
            enterForgroundTime = Date.now
            
            if let enterBackgroundTime {
                if(enterForgroundTime!.timeIntervalSince(enterBackgroundTime) > 10) {
                    SharedPreferencesUtils.shared.logout()
                    showLoginVC(navigationController: homeVC.navigationController)
                }
            }
            enterBackgroundTime = nil
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        debugPrint("sceneWillResignActive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        debugPrint("sceneWillEnterForeground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        debugPrint("sceneDidEnterBackground")
        if let _ = topMostController() as? HomeViewController {
            enterBackgroundTime = Date.now
        }
    }
    
    private func showLoginVC(navigationController: UINavigationController?) {
        let vc = LoginViewController()
        let new = UINavigationController(rootViewController: vc)
        new.modalPresentationStyle = .fullScreen
        navigationController?.present(new, animated: true)
    }
    
    private func topMostController() -> UIViewController? {
        guard let window = UIApplication.shared.windows.first, let rootViewController = window.rootViewController else {
            return nil
        }

        var topController = rootViewController

        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }
        
        if let navigationController = topController as? UINavigationController{
            return navigationController.viewControllers.last
        }

        return topController
    }


}

