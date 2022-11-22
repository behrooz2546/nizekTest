//
//  AlertUtils.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import UIKit

class AlertUtils {

    static func displayAlert(vc: UIViewController, message: String, handler: @escaping ((UIAlertAction) -> Void)) {

        let alertController = UIAlertController(title: message, message: "", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: handler)
        alertController.addAction(defaultAction)

        vc.present(alertController, animated: true, completion: nil)
    }

}
