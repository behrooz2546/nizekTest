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
        navigationController?.pushViewController(vc, animated: true)
    }
    
    var contentView: HomeView {
        return view as! HomeView
    }
    
    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLayoutSubviews() {
        contentView.logoutButton.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc func handlerButton() {
        debugPrint("logoutButtonTapped")
    }
}
