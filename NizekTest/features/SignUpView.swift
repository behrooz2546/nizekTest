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
    lazy var appButton: AppButton = {
        let button = AppButton.makeButton(title: "title", subtitle: "subtitle")
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
        addSubview(appButton)
        
        
        
    }
    
    @objc func handlerButton() {
        debugPrint("handlerButton")
    }
    
    private func createConstraints() {
        
        appButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
    }
    
    override func layoutSubviews() {
        appButton.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
    }
}
