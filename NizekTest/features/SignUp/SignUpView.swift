//
//  SignUpView.swift
//  NizekTest
//
//  Created by behrooz azimifar on 20/11/2022.
//

import Foundation
import UIKit
import SnapKit

class SignUpView: UIView {
    
    lazy var fullNameTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.placeholder = "Full name"
        return view
    }()
    
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


    lazy var registerButton: AppButtonGeneric = {
        let button = AppButtonGeneric.makeButton(title: "Register")
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

        addSubview(fullNameTextField)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
    }
    
    
    
    private func createConstraints() {
        
        
        fullNameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.right.equalToSuperview().offset(-32.w)
            make.left.equalToSuperview().offset(32.w)
            make.height.equalTo(40.h)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(fullNameTextField.snp.bottom).offset(24.h)
            make.right.equalToSuperview().offset(-32.w)
            make.left.equalToSuperview().offset(32.w)
            make.height.equalTo(40.h)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameTextField.snp.bottom).offset(24.h)
            make.right.equalToSuperview().offset(-32.w)
            make.left.equalToSuperview().offset(32.w)
            make.height.equalTo(40.h)
        }
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-40.h)
            make.right.equalToSuperview().offset(-32.w)
            make.left.equalToSuperview().offset(32.w)
            make.height.equalTo(40.h)
        }
    }
    
    override func layoutSubviews() {
        
    }
}
