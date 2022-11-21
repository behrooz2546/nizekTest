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
    lazy var lablesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.backgroundColor = .green
        stackView.isUserInteractionEnabled = false
        return stackView
    }()
    
    lazy var button1: AppButtonGeneric = {
        let button = AppButtonGeneric.makeButton(title: "title", subtitle: "subtitle")
        return button
    }()
    
    lazy var button2: AppButtonGeneric = {
        let button = AppButtonGeneric.makeButton(title: "title", subtitle: "subtitle", iconName: "message")
        return button
    }()

    lazy var button3: AppButtonGeneric = {
        let button = AppButtonGeneric.makeButton(title: "title", iconName: "message")
        return button
    }()

    lazy var button4: AppButtonGeneric = {
        let button = AppButtonGeneric.makeButton(title: "title")
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

        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        addSubview(button4)
    }
    
    @objc func handlerButton() {
        debugPrint("handlerButton")
    }
    
    private func createConstraints() {
        
        
        button1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        
        button2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button1.snp.bottom).offset(24)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        
        button3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button2.snp.bottom).offset(24)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        
        button4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button3.snp.bottom).offset(24)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
    }
    
    override func layoutSubviews() {
        button1.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
        button2.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
        button3.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
        button4.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
    }
}
