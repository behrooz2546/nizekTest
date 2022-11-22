//
//  LoginViewModel.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    
    var errorMessage: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var successLogin = BehaviorRelay<Bool>(value: false)
    
    let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func login(username: String, password: String) {
        userRepository.getUserWithUsername(username: username) { user in
            if let user {
                if (user.password?.lowercased() == password.lowercased()) {
                    self.successLogin.accept(true)
                    SharedPreferencesUtils.shared.saveFullname(fullname: user.username ?? "")
                } else {
                    self.errorMessage.accept("Password Incorrect")
                }
                
            } else {
                self.errorMessage.accept("Error Login")
            }
            
        } onError: { error in
            debugPrint(error)
            self.errorMessage.accept(error.localizedLowercase)
        }
    }
}
