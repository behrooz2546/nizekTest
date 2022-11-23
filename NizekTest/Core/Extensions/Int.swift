//
//  Int.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import UIKit

extension Int {
    
    enum Device {
        case iPhone
        var size: (width: CGFloat, height: CGFloat) {
            switch self {
            case .iPhone:
                    return (375, 812)
            }
        }
    }
    
    var w: CGFloat {
        get {
            UIScreen.main.bounds.width * (CGFloat(self) / Device.iPhone.size.width)
        }
    }
    
    var h: CGFloat {
        get {
            UIScreen.main.bounds.height * (CGFloat(self) / Device.iPhone.size.height)
        }
    }
}
