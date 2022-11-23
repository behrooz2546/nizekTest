//
//  Resolver.swift
//  NizekTest
//
//  Created by behrooz azimifar on 23/11/2022.
//

import Foundation
import Swinject

final class Resolver {
  static let shared = Resolver()
  
  private var container = buildContainer()
  
  func resolve<T>(_ type: T.Type) -> T {
    container.resolve(T.self)!
  }
}

fileprivate func buildContainer() -> Container {
  let container = Container()
  
  container.register(UserRepository.self) { _ in
    return UserRepositoryImpl()
  }
  .inObjectScope(.container)
    
  
  return container
}
