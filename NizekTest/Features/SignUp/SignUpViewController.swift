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
    
    let viewModel = SignUpViewModel(userRepository: Resolver.shared.resolve(UserRepository.self))
    let disposebag = DisposeBag()
    
    static func show(navigationController: UINavigationController?, push: Bool = true) {
        let vc = SignUpViewController()
        if (push) {
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        navigationController?.present(nc, animated: true)
    }
    
    var contentView: SignUpView {
        return view as! SignUpView
    }
    
    override func loadView() {
        view = SignUpView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindSuccessRegister()
        bindAlreadySinguped()
        
        contentView.registerButton.addTarget(self, action: #selector(handleRegisterButtonTapped), for: .touchUpInside)
    }
    
    
    //MARK: - Actions
    @objc func handleRegisterButtonTapped() {
        
        guard let fullnameText = contentView.fullNameTextField.text, !fullnameText.isEmpty else {
            AlertUtils.displayAlert(vc: self, message: "full Name is Empty")
            return
        }
        guard let usernameText = contentView.usernameTextField.text, !usernameText.isEmpty else {
            AlertUtils.displayAlert(vc: self, message: "username is Empty")
            return
        }
        guard let passwordText = contentView.passwordTextField.text, !passwordText.isEmpty else {
            AlertUtils.displayAlert(vc: self, message: "password is Empty")
            return
        }
        
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
