//
//  SharedPreferencesUtils.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation

class SharedPreferencesUtils {
    private let defaults = UserDefaults.standard
    private let keyFullName = "keyFullName"
    
    class var shared: SharedPreferencesUtils {
        struct Static {
            static let instance = SharedPreferencesUtils()
        }
      
        return Static.instance
    }
    
    func saveFullname(fullname: String) {
        defaults.setValue(fullname, forKey: keyFullName)
    }
    
    func getFullname() -> String? {
        return defaults.string(forKey: keyFullName)
    }
    
    func isLogged() -> Bool {
        let fullname = getFullname()
        return (fullname != nil) ? true : false
    }
    
    func logout() {
        defaults.setValue(nil, forKey: keyFullName)
    }
}
