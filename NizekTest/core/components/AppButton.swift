//
//  AppButton.swift
//  NizekTest
//
//  Created by behrooz azimifar on 20/11/2022.
//

import Foundation
import UIKit

class AppButton: UIButton {
    
    let titleText: String
    let subtitleText: String?
    let iconName: String?
    
    @objc func handle() {
        debugPrint("handleGesture")
    }
    
    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let secondaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var lablesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.isUserInteractionEnabled = false
        
        
        return stackView
    }()
    
    lazy var iconContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    init(frame: CGRect, titleText: String, subtitleText: String?, iconName: String?) {
        
        self.titleText = titleText
        self.subtitleText = subtitleText
        self.iconName = iconName
        
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func commonInit() {
        self.initializeUI()
        self.createConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.primaryLabel.text = self.titleText
        self.secondaryLabel.text = self.subtitleText
        self.icon.image = UIImage(systemName: self.iconName ?? "")
    }
    
    private func initializeUI() {
        
        addSubview(horizontalStackView)
        
        if (iconName != nil) {
            horizontalStackView.addArrangedSubview(iconContainerView)
        }
        
        horizontalStackView.addArrangedSubview(lablesStackView)
        lablesStackView.addArrangedSubview(primaryLabel)


        if(iconName != nil) {
            iconContainerView.addSubview(icon)            
        }

        if (subtitleText != nil) {
            lablesStackView.addArrangedSubview(secondaryLabel)
        }
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        
        self.backgroundColor = .white
        
    }
    

    private func createConstraints() {
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
        }
        
        
        primaryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        
        if(subtitleText != nil) {
            secondaryLabel.snp.makeConstraints { make in
                make.bottom.equalToSuperview()
                make.centerX.equalToSuperview()
            }
        }
        
        if (iconName != nil) {
            icon.snp.makeConstraints { make in
                make.width.height.equalTo(25)
                make.center.equalToSuperview()
            }
        }
        
        iconContainerView.snp.makeConstraints { make in
            make.width.equalTo(40)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.transform = CGAffineTransform.identity
        }
        
        super.touchesBegan(touches, with: event)
    }
}


extension AppButton {
    
    static func makeButton(title: String, subtitle: String, iconName: String) -> AppButton {
        return AppButton(frame: .zero, titleText: title, subtitleText: subtitle, iconName: iconName)
    }
    
    static func makeButton(title: String, subtitle: String) -> AppButton {
        return AppButton(frame: .zero, titleText: title, subtitleText: subtitle, iconName: nil)
    }
    
    static func makeButton(title: String) -> AppButton {
        return AppButton(frame: .zero, titleText: title, subtitleText: nil, iconName: nil)
    }
}
