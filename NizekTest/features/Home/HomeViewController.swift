//
//  HomeViewController.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    static func show(navigationController: UINavigationController?) {
        let vc = HomeViewController()
        let new = UINavigationController(rootViewController: vc)
        new.modalPresentationStyle = .fullScreen
        navigationController?.present(new, animated: true)
    }
    
    var contentView: HomeView {
        return view as! HomeView
    }
    
    override func loadView() {
        view = HomeView()
        
        contentView.logoutButton.addTarget(self, action: #selector(handleLogoutButtonTapped), for: .touchUpInside)
        
        let fullname = SharedPreferencesUtils.shared.getFullname()
        contentView.fullnameLabel.text = "Welcome \(fullname ?? "")"
    }
    
    
    
    //MARK: - Actions
    @objc func handleLogoutButtonTapped() {
        debugPrint("logoutButtonTapped")
        
        let navigationController = UINavigationController(rootViewController: SignUpViewController())
        navigationController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(navigationController, animated: true)
        
        SharedPreferencesUtils.shared.logout()
    }
}
