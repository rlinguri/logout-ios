//
//  Interactor.swift
//  logout
//
//  Created by Roderic Linguri on 5/29/21.
//

import UIKit

/// VIPER Interactor Protocol
protocol Interactor: AnyObject {
  
  // MARK: - Required Properties
  
  /// The module's router
  var router: Router { get set }
  
  /// The module's presenter
  var presenter: Presenter? { get set }
  
  // MARK: - Required Methods
  
  /// Required initializer to set the router property
  ///
  /// - Parameter router: The module's router
  init(router: Router)
  
  /// Receives a notification from the router
  ///
  /// - Parameter entity: the `Entity` instance
  func notify(entity: Entity)
  
  /// Receives a notification from the presenter
  ///
  /// - Parameter entity: the `Entity` instance
  func post(entity: Entity)

}

extension Interactor {
  
  /// Interactor's default post implementation
  ///
  /// Override this method to access entity coming from view controller
  /// before it is forwarded to the interactor
  ///
  /// - Parameter entity: the `Entity` instance
  func post(entity: Entity) {
    self.router.post(entity: entity)
  }
  
  /// Interactor's default notify implementation
  ///
  /// Override this method to access entity coming from the router
  /// before it is passed down to the presenter
  ///
  /// - Parameter entity: the `Entity` instance
  func notify(entity: Entity) {
    self.presenter?.notify(entity: entity)
  }
  
}
