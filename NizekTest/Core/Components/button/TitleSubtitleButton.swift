//
//  TitleSubtitleButton.swift
//  NizekTest
//
//  Created by behrooz azimifar on 21/11/2022.
//

import Foundation
import UIKit

class TitleSubtitleButton: AppButtonGeneric {
    
    let titleText: String
    let subtitleText: String?
    
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
        stackView.isUserInteractionEnabled = false
        return stackView
    }()
    
    
    
    init(frame: CGRect, titleText: String, subtitleText: String?) {
        
        self.titleText = titleText
        self.subtitleText = subtitleText
        
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
    }
    
    private func initializeUI() {
        
        primaryLabel.font = titleFont
        primaryLabel.textColor = titleColor
        
        secondaryLabel.font = subtitleFont
        secondaryLabel.textColor = subtitleColor
        
        addSubview(lablesStackView)
        lablesStackView.addArrangedSubview(primaryLabel)
        lablesStackView.addArrangedSubview(secondaryLabel)
    }
    
    private func createConstraints() {
        lablesStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4.h, left: 4.w, bottom: 4.h, right: 4.w))
        }
        
        primaryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        secondaryLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
}
