//
//  UserRepository.swift
//  NizekTest
//
//  Created by behrooz azimifar on 23/11/2022.
//

import Foundation

protocol UserRepository {
    func createUser(
        fullName: String,
        username: String,
        password: String,
        onSuccess: @escaping () -> Void,
        onError: @escaping (_: String) -> Void
    )
    
    func getAllUsers(
        onSuccess: @escaping (_: [UserEntity]) -> Void,
        onError: @escaping (_: String) -> Void
    )
    
    func getUserWithUsername(
        username: String,
        onSuccess: @escaping (_: UserEntity?) -> Void,
        onError: @escaping (_: String) -> Void
    )
}
