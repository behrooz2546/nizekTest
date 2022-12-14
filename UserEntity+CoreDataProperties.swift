//
//  UserEntity+CoreDataProperties.swift
//  
//
//  Created by behrooz azimifar on 23/11/2022.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}
