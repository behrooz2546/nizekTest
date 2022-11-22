//
//  SceneDelegate.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import UIKit

extension SceneDelegate {
    var topMostController: UIViewController? {
        get {
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
}
