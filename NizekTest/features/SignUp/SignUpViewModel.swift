//
//  SignUpViewModel.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

class SignUpViewModel {
    
    var errorMessage: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var successRegister = BehaviorRelay<Bool>(value: false)
    
    let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func createUser(fullName: String, username: String, password: String) {
        userRepository.createUser(fullName: fullName, username: username, password: password) {
            debugPrint("Success Create User")
            SharedPreferencesUtils.shared.saveFullname(fullname: fullName)
            self.successRegister.accept(true)
        } onError: { error in
            debugPrint(error)
            self.successRegister.accept(false)
        }
    }
}
