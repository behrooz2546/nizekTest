//
//  SignUpViewController.swift
//  NizekTest
//
//  Created by behrooz azimifar on 20/11/2022.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    static func show(navigationController: UINavigationController) {
        let vc = SignUpViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    var contentView: SignUpView {
        return view as! SignUpView
    }
    
    override func loadView() {
        view = SignUpView()
    }
    
    override func viewDidLayoutSubviews() {
        
    }
}
