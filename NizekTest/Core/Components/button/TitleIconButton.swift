//
//  TitleIconButton.swift
//  NizekTest
//
//  Created by behrooz azimifar on 21/11/2022.
//

import Foundation
import UIKit

class TitleIconButton: AppButtonGeneric {
    
    let titleText: String
    let iconName: String?
    
    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
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
    
    init(frame: CGRect, titleText: String, iconName: String?) {
        
        self.titleText = titleText
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
        self.icon.image = UIImage(systemName: self.iconName ?? "")
    }
    
    private func initializeUI() {
        
        primaryLabel.font = titleFont
        primaryLabel.textColor = titleColor
        
        addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(icon)
        horizontalStackView.addArrangedSubview(primaryLabel)
        
    }
    

    private func createConstraints() {
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4.h, left: 8.w, bottom: 4.h, right: 4.w))
        }
        
        icon.snp.makeConstraints { make in
            make.width.height.equalTo(25.w)
        }
    }
}
