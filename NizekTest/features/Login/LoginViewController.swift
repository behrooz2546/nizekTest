//
//  LoginViewController.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    let viewModel = LoginViewModel(userRepository: UserRepository())
    let disposebag = DisposeBag()
    
    static func show(navigationController: UINavigationController?) {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    var contentView: LoginView {
        return view as! LoginView
    }
    
    override func loadView() {
        view = LoginView()
        
        bindSuccessLogin()
        bindError()
    }
    
    override func viewDidLayoutSubviews() {
        contentView.loginButton.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
    }
    
    
    //MARK: - Binds
    func bindSuccessLogin() {
        viewModel.successLogin.asObservable().subscribe { success in
            if (success) {
                HomeViewController.show(navigationController: self.navigationController)
            }
            
        }
    }
    
    func bindError() {
        viewModel.errorMessage.asObservable().subscribe { [weak self] error in
            if let error = error, let self = self {
                AlertUtils.displayAlert(vc: self, message: error) { _ in
                    
                }
            }
        }
    }
    
    //MARK: - Actions
    @objc func handlerButton() {
        
        guard let usernameText = contentView.usernameTextField.text, !usernameText.isEmpty else { return }
        guard let passwordText = contentView.passwordTextField.text, !passwordText.isEmpty else { return }
        
        viewModel.login(username: usernameText, password: passwordText)
    }
}
