//
//  SignUpViewController.swift
//  NizekTest
//
//  Created by behrooz azimifar on 20/11/2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {
    
    let viewModel = SignUpViewModel(userRepository: UserRepository())
    let disposebag = DisposeBag()
    
    static func show(navigationController: UINavigationController) {
        let vc = SignUpViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    var contentView: SignUpView {
        return view as! SignUpView
    }
    
    override func loadView() {
        view = SignUpView()
        
        
        
        bindSuccessRegister()
        bindAlreadySinguped()
    }
    
    override func viewDidLayoutSubviews() {
        contentView.registerButton.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc func handlerButton() {
        
        guard let fullnameText = contentView.fullNameTextField.text, !fullnameText.isEmpty else { return }
        guard let usernameText = contentView.usernameTextField.text, !usernameText.isEmpty else { return }
        guard let passwordText = contentView.passwordTextField.text, !passwordText.isEmpty else { return }
        
        viewModel.signUp(fullName: fullnameText, username: usernameText, password: passwordText)
    }
    
    
    
    func bindSuccessRegister() {
        viewModel.successRegister.asObservable().subscribe { success in
            if (success) {
                HomeViewController.show(navigationController: self.navigationController)
            }
            
        }
    }
    
    func bindAlreadySinguped() {
        viewModel.alreadySignuped.asObservable().subscribe { signUped in
            if (signUped) {
                AlertUtils.displayAlert(vc: self, message: "Please Login") { [weak self] _ in
                    if let self {
                        LoginViewController.show(navigationController: self.navigationController)
                    }
                }
            }
            
        }
    }
}
