//
//  UserRepository.swift
//  NizekTest
//
//  Created by behrooz azimifar on 22/11/2022.
//

import Foundation
import UIKit

class UserRepositoryImpl: UserRepository {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createUser(
        fullName: String,
        username: String,
        password: String,
        onSuccess: @escaping () -> Void,
        onError: @escaping (_: String) -> Void
    ) {
        let newUser = UserEntity(context: self.context)
        
        newUser.id = UUID()
        newUser.fullName = fullName
        newUser.username = username
        newUser.password = password
        
        do {
            try context.save()
            onSuccess()
        } catch (let error) {
            debugPrint(error)
            onError(error.localizedDescription)
        }
    }
    
    func getAllUsers(
        onSuccess: @escaping (_: [UserEntity]) -> Void,
        onError: @escaping (_: String) -> Void
    ) {
        do {
            let users = try context.fetch(UserEntity.fetchRequest())
            onSuccess(users)
        } catch (let error) {
            onError(error.localizedDescription)
        }
    }
    
    func getUserWithUsername(
        username: String,
        onSuccess: @escaping (_: UserEntity?) -> Void,
        onError: @escaping (_: String) -> Void
    ) {
        do {
            let fetchRequest = UserEntity.fetchRequest()
            let usernamePredicate = NSPredicate(format: "username LIKE %@", username)
            fetchRequest.predicate = usernamePredicate
            let users = try context.fetch(fetchRequest)
            if (users.count > 0) {
                onSuccess(users[0])
            } else {
                onSuccess(nil)
            }
        } catch (let error) {
            onError(error.localizedDescription)
        }
    }
}
