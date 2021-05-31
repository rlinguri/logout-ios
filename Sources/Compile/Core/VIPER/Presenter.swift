//
//  Presenter.swift
//  logout
//
//  Created by Roderic Linguri on 5/29/21.
//

import UIKit

/// VIPER Presenter Protocol
protocol Presenter: AnyObject {
  
  /// Handles the module's storage and networking tasks
  var interactor: Interactor { get set }
  
  /// Handles the module's user interface
  var viewController: ViewController? { get set }
  
  /// Initialize the presenter with an interactor
  ///
  /// - Parameter interactor: The module's interactor
  init(interactor: Interactor)
  
  /// Receives a notification from the module's view controller
  ///
  /// - Parameter entity: the `Entity` instance
  func post(entity: Entity)
  
  /// Receives a notification from the module's interactor
  ///
  /// - Parameter entity: the `Entity` instance
  func notify(entity: Entity)

}

extension Presenter {
  
  /// Presenter's default post implementation
  ///
  /// Override this method to access entity coming from view controller
  /// before it is forwarded to the interactor
  ///
  /// - Parameter entity: the `Entity` instance
  func post(entity: Entity) {
    self.interactor.post(entity: entity)
  }
  
  /// Presenter's default notify implementation
  ///
  /// Override this method to access entity coming from the interactor
  /// before it is passed down to the view controller
  ///
  /// - Parameter entity: the `Entity` instance
  func notify(entity: Entity) {
    self.viewController?.notify(entity: entity)
  }
  
}
