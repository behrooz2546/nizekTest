//
//  LoginViewController.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    static func show(navigationController: UINavigationController?) {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    var contentView: LoginView {
        return view as! LoginView
    }
    
    override func loadView() {
        view = LoginView()
    }
    
    override func viewDidLayoutSubviews() {
        contentView.loginButton.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc func handlerButton() {
        HomeViewController.show(navigationController: self.navigationController)
    }
}
