//
//  MainCoordinator.swift
//  NizekTest
//
//  Created by behrooz azimifar on 20/11/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let isLogged = SharedPreferencesUtils.shared.isLogged()
        if(isLogged) {
            let homeVC = HomeViewController()
            self.navigationController.pushViewController(homeVC, animated: true)
            return
        }
        
        let vc = SignUpViewController()
        self.navigationController.pushViewController(vc, animated: false)
    }
}
