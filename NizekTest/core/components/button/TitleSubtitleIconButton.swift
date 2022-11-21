//
//  TitleSubtitleIcon.swift
//  NizekTest
//
//  Created by behrooz azimifar on 21/11/2022.
//

import Foundation
import UIKit

class TitleSubtitleIconButton: AppButtonGeneric {
    
    let titleText: String
    let subtitleText: String?
    let iconName: String?
    
    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private let secondaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
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
    
    override func getTitleStyle() -> AppGenericButtonLabelStyle {
        return AppGenericButtonLabelStyle(font: .systemFont(ofSize: 20), color: .green)
    }
    
    private func initializeUI() {
        
        primaryLabel.font = getTitleStyle().font
        primaryLabel.textColor = getTitleStyle().color
        
        secondaryLabel.font = getSubtitleStyle().font
        secondaryLabel.textColor = getSubtitleStyle().color
        
        addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(iconContainerView)
        horizontalStackView.addArrangedSubview(lablesStackView)
        lablesStackView.addArrangedSubview(primaryLabel)
        iconContainerView.addSubview(icon)
        lablesStackView.addArrangedSubview(secondaryLabel)
    }
    

    private func createConstraints() {
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
        }
        
        primaryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        secondaryLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        icon.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.center.equalToSuperview()
        }
        
        iconContainerView.snp.makeConstraints { make in
            make.width.equalTo(40)
        }
        
    }
}
