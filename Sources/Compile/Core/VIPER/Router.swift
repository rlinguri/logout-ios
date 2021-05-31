//
//  Router.swift
//  logout
//
//  Created by Roderic Linguri on 5/29/21.
//

import UIKit

/// VIPER Router protocol
protocol Router: AnyObject {
  
  /// Weak reference to the parent module's view controller
  var parent: ViewController? { get set }
  
  /// Weak reference to this module's interactor
  var interactor: Interactor? { get set }
  
  init(parentController: ViewController?)
  
  /// Receive a notification from the parent module
  ///
  /// - Parameter entity: the `Entity` instance
  func notify(entity: Entity)
  
  /// Post a notification to the parent module
  ///
  /// - Parameter entity: the `Entity` instance
  func post(entity: Entity)
  
}

extension Router {
  
  /// Router's default post implementation
  ///
  /// Override this method to access entity coming from interactor
  /// before it is forwarded to the parent module's view controller
  ///
  /// - Parameter entity: the `Entity` instance
  func post(entity: Entity) {
    self.parent?.post(entity: entity)
  }
  
  /// Router's default notify implementation
  ///
  /// Override this method to access entity coming from parent controller
  /// before it is passed down to the current module's interactor
  ///
  /// - Parameter entity: the `Entity` instance
  func notify(entity: Entity) {
    self.interactor?.notify(entity: entity)
  }
  
}
