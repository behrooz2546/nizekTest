//
//  TitleButton.swift
//  NizekTest
//
//  Created by behrooz azimifar on 21/11/2022.
//

import Foundation
import UIKit

class TitleButton: AppButtonGeneric {
    
    let titleText: String
    
    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        return label
    }()
    
    init(frame: CGRect, titleText: String) {
        
        self.titleText = titleText
        
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
    }
    
    private func initializeUI() {
        
        primaryLabel.font = titleFont
        primaryLabel.textColor = titleColor
        
        addSubview(primaryLabel)
    }
    
    private func createConstraints() {
        
        primaryLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
