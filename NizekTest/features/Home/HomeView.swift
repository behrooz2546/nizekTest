//
//  HomeView.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import UIKit
import SnapKit

class HomeView: UIView {
    
    lazy var fullnameLabel: UILabel = {
        let view = UILabel()
        view.text = "Welcome"
        view.textAlignment = .center
        return view
    }()

    lazy var logoutButton: AppButtonGeneric = {
        let button = AppButtonGeneric.makeButton(title: "Logout")
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

        addSubview(fullnameLabel)
        addSubview(logoutButton)
    }
    
    private func createConstraints() {
        
        fullnameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.right.equalToSuperview().offset(-32)
            make.left.equalToSuperview().offset(32)
        }
        
        logoutButton.snp.makeConstraints { make in
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
