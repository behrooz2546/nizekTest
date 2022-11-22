//
//  LoginView.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import UIKit
import SnapKit

class LoginView: UIView {
    
    lazy var usernameTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.placeholder = "Username"
        return view
    }()

    lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.placeholder = "Password"
        view.isSecureTextEntry = true
        return view
    }()


    lazy var loginButton: AppButtonGeneric = {
        let button = AppButtonGeneric.makeButton(title: "Login")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    func commonInit() {
        self.initializeUI()
        self.createConstraints()
        
        self.backgroundColor = .white
        
    }
    
    private func initializeUI() {

        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    private func createConstraints() {
        
        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.right.equalToSuperview().offset(-32)
            make.left.equalToSuperview().offset(32)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameTextField.snp.bottom).offset(24)
            make.right.equalToSuperview().offset(-32)
            make.left.equalToSuperview().offset(32)
            make.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-40)
            make.right.equalToSuperview().offset(-32)
            make.left.equalToSuperview().offset(32)
            make.height.equalTo(40)
        }
    }
    
    override func layoutSubviews() {
        
    }
    
    
}
