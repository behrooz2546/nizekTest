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
    
    let viewModel = LoginViewModel(userRepository: Resolver.shared.resolve(UserRepository.self))
    let disposebag = DisposeBag()
    
    static func show(navigationController: UINavigationController?, push: Bool = true) {
        let vc = LoginViewController()
        if (push) {
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true)
    }
    
    var contentView: LoginView {
        return view as! LoginView
    }
    
    override func loadView() {
        view = LoginView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.loginButton.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
        
        bindSuccessLogin()
        bindError()
    }
    
    //MARK: - Binds
    func bindSuccessLogin() {
        viewModel.successLogin.asObservable().subscribe { [weak self] success in
            if (success) {
                if let self {
                    HomeViewController.show(navigationController: self.navigationController)
                }
            }
            
        }
    }
    
    func bindError() {
        viewModel.errorMessage.asObservable().subscribe { [weak self] error in
            if let error = error, let self = self {
                AlertUtils.displayAlert(vc: self, message: error)
            }
        }
    }
    
    //MARK: - Actions
    @objc func handlerButton() {
        
        guard let usernameText = contentView.usernameTextField.text, !usernameText.isEmpty else {
            AlertUtils.displayAlert(vc: self, message: "username is Empty")
            return
        }
        guard let passwordText = contentView.passwordTextField.text, !passwordText.isEmpty else {
            AlertUtils.displayAlert(vc: self, message: "password is Empty")
            return
        }
        
        viewModel.login(username: usernameText, password: passwordText)
    }
}
