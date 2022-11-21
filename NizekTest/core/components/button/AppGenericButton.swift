//
//  AppButton.swift
//  NizekTest
//
//  Created by behrooz azimifar on 20/11/2022.
//

import Foundation
import UIKit

class AppButtonGeneric: UIButton {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.transform = CGAffineTransform.identity
        }
        
        super.touchesBegan(touches, with: event)
    }
    
    func getTitleStyle() -> AppGenericButtonLabelStyle {
        return AppGenericButtonLabelStyle(font: .systemFont(ofSize: 18, weight: .bold), color: .black)
    }
    
    func getSubtitleStyle() -> AppGenericButtonLabelStyle {
        return AppGenericButtonLabelStyle(font: .systemFont(ofSize: 12, weight: .semibold), color: .black)
    }
}

class AppGenericButtonLabelStyle {
    let font: UIFont
    let color: UIColor
    
    init(font: UIFont, color: UIColor) {
        self.font = font
        self.color = color
    }
}

extension AppButtonGeneric {
    
    static func makeButton(title: String, subtitle: String, iconName: String) -> TitleSubtitleIconButton {
        return TitleSubtitleIconButton(frame: .zero, titleText: title, subtitleText: subtitle, iconName: iconName)
    }
    
    static func makeButton(title: String, subtitle: String) -> TitleSubtitleButton {
        return TitleSubtitleButton(frame: .zero, titleText: title, subtitleText: subtitle)
    }
    
    static func makeButton(title: String, iconName: String) -> TitleIconButton {
        return TitleIconButton(frame: .zero, titleText: title, iconName: iconName)
    }
    
    static func makeButton(title: String) -> TitleButton {
        return TitleButton(frame: .zero, titleText: title)
    }
}
